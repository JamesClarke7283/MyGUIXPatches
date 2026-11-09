/* godot-loader: run a Godot game exported with the official Linux
   templates on Guix System.

   The templates are linked for FHS distributions: their ELF interpreter is
   /lib64/ld-linux-x86-64.so.2, and they dlopen() the X11, Wayland, OpenGL,
   Vulkan, audio, D-Bus, fontconfig, udev and speech-dispatcher libraries by
   soname.  None of those are where the game looks for them on Guix System,
   so this program checks that it was given such an executable and starts
   it, unmodified, through the store's glibc loader:

     ld.so --preload preload.so --library-path DIRS --argv0 GAME GAME ARGS...

   preload.c explains what the preloaded library is for.  */

#define _GNU_SOURCE
#include <elf.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "config.h"

#ifndef __x86_64__
# error "only x86-64 export templates are supported"
#endif

static const char program[] = "godot-loader";

/* libXcursor's search path on Guix, used when XCURSOR_PATH is unset.  */
static const char xcursor_default_path[] =
  "~/.local/share/icons:~/.icons:~/.guix-profile/share/icons:"
  "/run/current-system/profile/share/icons";

static void usage(FILE *out)
{
  fprintf(out,
          "Usage: %s GAME [ARGUMENT...]\n"
          "Run GAME, a Linux executable exported from Godot with the official\n"
          "export templates (such as Game.x86_64), on Guix System.  The\n"
          "ARGUMENTs are passed to the game unchanged.\n",
          program);
}

/* Parse the ELF headers of FILE.  Return 0 for a dynamically linked x86-64
   executable, 1 for a statically linked one, which needs no loader, or -1
   after printing why FILE cannot be run.  */
static int inspect(const char *file)
{
  int fd = open(file, O_RDONLY | O_CLOEXEC);
  if (fd < 0)
    {
      fprintf(stderr, "%s: %s: %s\n", program, file, strerror(errno));
      return -1;
    }

  int result = -1;
  Elf64_Ehdr header;
  ssize_t size = pread(fd, &header, sizeof header, 0);

  if (size >= 2 && memcmp(&header, "#!", 2) == 0)
    fprintf(stderr,
            "%s: %s: is a script, not an executable.  Godot's console "
            "wrapper only starts the executable beside it; pass that "
            "instead.\n", program, file);
  else if (size != sizeof header || memcmp(header.e_ident, ELFMAG, SELFMAG) != 0)
    fprintf(stderr, "%s: %s: not an ELF executable\n", program, file);
  else if (header.e_ident[EI_CLASS] != ELFCLASS64
           || header.e_ident[EI_DATA] != ELFDATA2LSB
           || header.e_machine != EM_X86_64)
    fprintf(stderr, "%s: %s: not an x86-64 executable\n", program, file);
  else if (header.e_type != ET_EXEC && header.e_type != ET_DYN)
    fprintf(stderr, "%s: %s: not an executable\n", program, file);
  else
    {
      result = 1;
      for (unsigned i = 0; i < header.e_phnum; i++)
        {
          Elf64_Phdr segment;
          off_t offset = header.e_phoff + (off_t) i * header.e_phentsize;
          if (pread(fd, &segment, sizeof segment, offset) != sizeof segment)
            {
              fprintf(stderr, "%s: %s: truncated ELF file\n", program, file);
              result = -1;
              break;
            }
          if (segment.p_type == PT_INTERP)
            {
              result = 0;
              break;
            }
        }
    }

  close(fd);
  return result;
}

/* Godot's X11 and Wayland display servers both fall back to a cursor theme
   named "default" when none is configured, which is the case for XWayland
   clients under GNOME.  Guix provides no such theme, so the game would get
   no pointer shapes.  Offer one (Adwaita) after the user's own icon
   directories; a configured theme still takes precedence.  */
static void provide_default_cursor_theme(void)
{
  if (getenv("XCURSOR_THEME") != NULL)
    return;

  const char *path = getenv("XCURSOR_PATH");
  if (path == NULL || *path == '\0')
    path = xcursor_default_path;
  else if (strstr(path, GODOT_LOADER_ICONS) != NULL)
    return;                     /* the game is relaunching itself */

  char *value;
  if (asprintf(&value, "%s:%s", path, GODOT_LOADER_ICONS) >= 0)
    {
      setenv("XCURSOR_PATH", value, 1);
      free(value);
    }
}

int main(int argc, char **argv)
{
  int first = 1;

  if (argc > 1 && (strcmp(argv[1], "--help") == 0
                   || strcmp(argv[1], "-h") == 0))
    {
      usage(stdout);
      return 0;
    }
  if (argc > 1 && strcmp(argv[1], "--version") == 0)
    {
      printf("%s %s\n", program, GODOT_LOADER_VERSION);
      return 0;
    }
  if (argc > 1 && strcmp(argv[1], "--") == 0)
    first = 2;
  if (argc <= first)
    {
      usage(stderr);
      return 2;
    }

  /* Godot treats the directory of its executable as the game's directory,
     so give the loader, and through it the game, the canonical name.  */
  char game[PATH_MAX];
  if (realpath(argv[first], game) == NULL)
    {
      fprintf(stderr, "%s: %s: %s\n", program, argv[first], strerror(errno));
      return 127;
    }

  switch (inspect(game))
    {
    case -1:
      return 126;
    case 1:
      execv(game, argv + first);
      fprintf(stderr, "%s: %s: %s\n", program, game, strerror(errno));
      return 126;
    }

  provide_default_cursor_theme();

  /* ld.so's options, the game, its arguments and the terminating NULL.  */
  size_t count = 8 + (size_t) (argc - first - 1) + 1;
  char **args = malloc(count * sizeof *args);
  if (args == NULL)
    {
      fprintf(stderr, "%s: %s\n", program, strerror(errno));
      return 127;
    }

  size_t n = 0;
  args[n++] = (char *) GODOT_LOADER_INTERPRETER;
  args[n++] = (char *) "--preload";
  args[n++] = (char *) GODOT_LOADER_PRELOAD;
  args[n++] = (char *) "--library-path";
  args[n++] = (char *) GODOT_LOADER_LIBRARY_PATH;
  args[n++] = (char *) "--argv0";
  args[n++] = game;
  args[n++] = game;
  for (int i = first + 1; i < argc; i++)
    args[n++] = argv[i];
  args[n] = NULL;

  execv(GODOT_LOADER_INTERPRETER, args);
  fprintf(stderr, "%s: %s: %s\n", program, GODOT_LOADER_INTERPRETER,
          strerror(errno));
  return 127;
}
