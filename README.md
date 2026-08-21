# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package  | Stow target  | Contents                                          |
|----------|--------------|---------------------------------------------------|
| `claude` | `~/.claude/` | Claude Code global config, hooks, slash commands  |

### claude

- `CLAUDE.md` — global instructions for all projects (communication style, safety rules,
  architecture guidance, version control)
- `settings.json` — permissions allowlist, pre-tool-use hooks, UI preferences
- `hooks/check-secrets.sh` — blocks reads/edits targeting secret files (`.key`, `.secret`, `pwd.env`, …)
- `commands/commit.md` — `/commit` slash command: runs pre-commit, then creates a conventional commit
- `commands/todos.md` — `/todos` slash command: collects open tasks across all working directories

#### VS Code

VS Code's Copilot Chat can also read `CLAUDE.md` files directly — no separate config needed. Setting
`chat.useClaudeMdFile` (VS Code `settings.json`) attaches `CLAUDE.md` at the workspace root,
`.claude/CLAUDE.md`, and `~/.claude/CLAUDE.md` (this repo's stowed file) as always-on instructions,
the same way `AGENTS.md` works. To enable it globally: `Ctrl+Shift+P` → "Preferences: Open User
Settings (JSON)" → add:

```json
"chat.useClaudeMdFile": true
```

## Install

```bash
# Prerequisites
sudo apt install stow   # Debian/Ubuntu
# or: brew install stow

# Clone
git clone git@github.com:mjechow/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow a package (creates symlinks in ~)
stow claude
```

`stow claude` creates symlinks inside `~/.claude/` pointing into `~/dotfiles/claude/.claude/`.

## Development

```bash
pip install pre-commit
pre-commit install
```

CI runs `pre-commit run --all-files` on every push/PR to `main`
([.github/workflows/ci.yml](.github/workflows/ci.yml)); hooks are defined in
[.pre-commit-config.yaml](.pre-commit-config.yaml) (shellcheck, shfmt, pymarkdown, yamllint,
actionlint, conventional commit messages, betterleaks, plus trailing-whitespace/JSON/YAML checks).

## Notes

- `~/.claude/settings.local.json` is machine-local (permissions specific to each host) and not tracked.
- The hooks assume `jq` is available on `PATH`.

## License

[Unlicense](LICENSE) — public domain.
