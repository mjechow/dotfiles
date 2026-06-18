# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Stow target | Contents |
|---------|-------------|----------|
| `claude` | `~/.claude/` | Claude Code global config, hooks, slash commands |

### claude

- `CLAUDE.md` — global instructions for all projects (communication style, safety rules, architecture guidance)
- `settings.json` — permissions allowlist, pre-tool-use hooks, UI preferences
- `hooks/check-secrets.sh` — blocks reads/edits targeting secret files (`.key`, `.secret`, `pwd.env`, …)
- `commands/commit.md` — `/commit` slash command: runs pre-commit, then creates a conventional commit
- `commands/todos.md` — `/todos` slash command: collects open tasks across all working directories

## Install

```bash
# Prerequisites
sudo apt install stow   # Debian/Ubuntu
# or: brew install stow

# Clone
git clone git@github.com:mjechow/dotfiles.git ~/dotfiles

# Stow a package (creates symlinks in ~)
cd ~/dotfiles
stow claude
```

`stow claude` creates `~/.claude/` as a symlink tree pointing into `~/dotfiles/claude/.claude/`.

## Notes

- `~/.claude/settings.local.json` is machine-local (permissions specific to each host) and not tracked.
- The hooks assume `jq` is available on `PATH`.
