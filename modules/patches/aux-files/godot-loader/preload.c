/* Preloaded by godot-loader into the game it starts.

   godot-loader runs the game as "ld.so --argv0 GAME GAME ...", so the
   kernel's /proc/self/exe names the loader, not the game.  Godot reads that
   link to find itself (OS_Unix::get_executable_path), and a release template
   depends on the answer: it loads the project from the PCK embedded in that
   file or from GAME.pck beside it, reads override.cfg and GDExtension
   libraries from its directory, makes that directory its working directory,
   and relaunches itself through that file for OS.create_instance() and
   OS.set_restart_on_exit().  Release templates refuse --main-pack, so there
   is no other way to point them at their data.

   This library therefore
     - answers readlink() of the game's /proc/.../exe with GAME, which ld.so
       passed as argv[0];
     - starts GAME through godot-loader when the game starts itself, because
       GAME cannot be executed directly on Guix System.  Godot does that with
       execvp(GAME, ...) for OS.create_process(), OS.create_instance() and
       restarts, and with popen("\"GAME\" \"ARG\"... 2>&1") for OS.execute();
       and
     - names the process after GAME instead of "ld-linux-x86-64".

   Processes the game starts do not inherit it.  */

#define _GNU_SOURCE
#include <dlfcn.h>
#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <unistd.h>

#include "config.h"

static char game[PATH_MAX];
static size_t game_length;

/* glibc passes main's arguments to ELF constructors.  */
__attribute__((constructor))
static void init(int argc, char **argv, char **envp)
{
  (void) envp;
  if (argc < 1 || argv[0] == NULL || argv[0][0] != '/')
    return;

  size_t length = strlen(argv[0]);
  if (length >= sizeof game)
    return;
  memcpy(game, argv[0], length + 1);
  game_length = length;

  prctl(PR_SET_NAME, strrchr(game, '/') + 1, 0, 0, 0);
}

static int is_own_executable_link(const char *path)
{
  if (game_length == 0)
    return 0;
  if (strcmp(path, "/proc/self/exe") == 0)
    return 1;

  char own[64];
  snprintf(own, sizeof own, "/proc/%ld/exe", (long) getpid());
  return strcmp(path, own) == 0;
}

ssize_t readlink(const char *restrict path, char *restrict buffer, size_t size)
{
  static ssize_t (*next)(const char *restrict, char *restrict, size_t);

  if (is_own_executable_link(path))
    {
      /* Like readlink(2): no terminating NUL, truncated to SIZE.  */
      size_t length = game_length < size ? game_length : size;
      memcpy(buffer, game, length);
      return (ssize_t) length;
    }

  if (next == NULL)
    next = (ssize_t (*)(const char *restrict, char *restrict, size_t))
      dlsym(RTLD_NEXT, "readlink");
  if (next == NULL)
    {
      errno = ENOSYS;
      return -1;
    }
  return next(path, buffer, size);
}

int execvp(const char *file, char *const argv[])
{
  static int (*next)(const char *, char *const[]);

  if (game_length != 0 && strcmp(file, game) == 0)
    {
      size_t count = 0;
      while (argv[count] != NULL)
        count++;

      /* godot-loader GAME ARGV[1]... NULL */
      size_t extra = count > 0 ? count - 1 : 0;
      char **args = malloc((extra + 3) * sizeof *args);
      if (args == NULL)
        {
          errno = ENOMEM;
          return -1;
        }
      args[0] = (char *) GODOT_LOADER;
      args[1] = game;
      for (size_t i = 0; i < extra; i++)
        args[2 + i] = argv[1 + i];
      args[2 + extra] = NULL;

      execv(GODOT_LOADER, args);
      int error = errno;
      free(args);
      errno = error;
      return -1;
    }

  if (next == NULL)
    next = (int (*)(const char *, char *const[])) dlsym(RTLD_NEXT, "execvp");
  if (next == NULL)
    {
      errno = ENOSYS;
      return -1;
    }
  return next(file, argv);
}

FILE *popen(const char *command, const char *mode)
{
  static FILE *(*next)(const char *, const char *);

  if (next == NULL)
    next = (FILE *(*)(const char *, const char *)) dlsym(RTLD_NEXT, "popen");
  if (next == NULL)
    {
      errno = ENOSYS;
      return NULL;
    }

  /* OS_Unix::execute() quotes the program and each argument.  */
  if (game_length != 0 && command[0] == '"'
      && strncmp(command + 1, game, game_length) == 0
      && command[1 + game_length] == '"')
    {
      char *rerouted;
      if (asprintf(&rerouted, "\"%s\" %s", GODOT_LOADER, command) < 0)
        {
          errno = ENOMEM;
          return NULL;
        }
      FILE *stream = next(rerouted, mode);
      int error = errno;
      free(rerouted);
      errno = error;
      return stream;
    }

  return next(command, mode);
}
