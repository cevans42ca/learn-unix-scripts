### Project Overview
The `learn-unix-scripts` project is an interactive, shell-based tutorial system for learning Unix/Linux concepts. It uses a series of "belts" (inspired by martial arts) to progress students through various skill levels.

### Core Architecture
- **Interactive Scripts**: The main interface is the `learn` script. Students perform tasks and verify them using the `check` script (sourced as `. check`).
- **Master & Replacements**: To allow for site-specific customization while maintaining a shared core, the project uses a "master/replacement" system.
    - `main/master-scripts/*-master`: Core logic with GUID-based insertion/replacement markers.
    - `main/replacements/*-replace`: Shared replacements used during the build process.
    - `main/site-install/*-replace`: Where site-specific customizations should be placed.
    - `main/replace-all`: A script that merges masters and replacements to generate the final scripts in `main/dist/bin`.
- **Progress Tracking**: Student progress is saved in `~/.learnUnixScripts` by default.

### Key Files
- `configure`: The entry point for setting up the environment. It detects terminal capabilities, bash version (requires 4.0+ for associative arrays), and date utility variants.
- `Makefile`: Orchestrates the building of scripts and Docker images.
- `verify`: Checks if the current terminal environment supports all required features for the exercises.
- `main/master-scripts/learn-master`: The main engine for the `learn` command.
- `main/master-scripts/checkmain-master`: The main engine for the `. check` command.
- `main/replacements/common-replace`: Contains the definition of belt ranks and their constituent exercises.

### Belt Progression (defined in `common-replace`)
1.  **White Belt**: Basics, terminal interaction, `cd`, `ls`.
2.  **Yellow Stripe**: `pwd`, `mkdir`, `rmdir`, quotes, `cat`, `less`.
3.  **Yellow Belt**: Terminals and shells, tab completion, command history (`Ctrl+r`, `!!`).
4.  **Green Stripe**: Command line options, `ls` details, `df`, `mount`.
5.  **Green Belt**: `Ctrl+c`, `Ctrl+l`, hidden files, directory stacks (`pushd`, `popd`).
6.  **Blue Stripe**: Archiving (`tar`, `zip`), text editors (`vi`, `nano`).
7.  **Blue Belt**: Pipes, redirection, `stdout`/`stderr`, `cut`, `tee`, epoch time.
8.  **Red Stripe**: `du`, `sort`, `diff`, `mv`, `rm -rf`.
9.  **Red Belt**: Programs vs commands, `find` (glob, type, mtime, size, xargs), symlinks.
10. **Black Stripe**: Processes, states, signals, `kill`, job control (`Ctrl+z`).
11. **Assistant Black Belt**: File permissions (`stat`, `namei`), introduction to scripting (variables, loops).
12. **First Degree Black Belt**: Next steps and advanced concepts (prompt customization, aliases, sudo, rsync, etc.).

### Development Workflow
1.  Modify `*-master` scripts for core changes.
2.  Modify `*-replace` scripts for customization.
3.  Run `configure` and `make` to generate executable scripts in `main/dist/bin`.
4.  Use `main/docker/Dockerfile` to build a standardized learning environment.

### AI Agent Guidelines
- When suggesting changes to exercises, modify the `*-master` files in `main/master-scripts/` rather than the generated files in `main/dist/bin`.
- Respect the GUID markers (`# insert <GUID>`, `# replace start <GUID>`) as they are used by the `replace-all` script.
- Ensure any new shell features are compatible with Bash 4.0+.
