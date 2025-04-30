# Environment Bootstrap

This repository provides a structured and automated way to bootstrap development environments. It includes scripts, templates, and configurations that go beyond basic file copying (e.g., dotfiles). The goal is to:

- Keep critical system configurations (CLI tools, keybindings, applications, etc.) synchronized.
- Enable quick and consistent setup of new systems.

This setup relies on [chezmoi’s change detection mechanism](https://www.chezmoi.io/user-guide/use-scripts-to-perform-actions) to automate configuration management.

---

## Folder Structure

### `track/`
- Contains configuration files and other content to be imported and managed.
- These files are tracked and reapplied via import scripts using `chezmoi`.
- Example: When a new Homebrew formula is added, the corresponding tracked file is updated.

### `import/`
- Scripts or playbooks that are executed when changes are detected in tracked files.
- Simple tracked files may not have a dedicated import script, their content is then imported directly from `chezmoi` scripts
- Example: Installing Homebrew packages based on a tracked `brew bundle` dump.

### `export/`
- Scripts that facilitate updating tracked files by extracting the current system state.
- Example: Dumping the list of all currently installed Homebrew formulae.

> **Note:**  
> Some export scripts may depend on tools installed by the import process.  
> It is recommended to ensure your configuration is applied (`chezmoi apply`) before running any export scripts.
