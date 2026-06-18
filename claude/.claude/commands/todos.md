# Open Tasks

Find all open tasks in the current working context:

1. Look for `todo.md` files in the current project directory and any additional working directories.
   Read each one and extract all unchecked items (`- [ ]`).
2. Search for `TODO`, `FIXME`, and `HACK` markers in tracked source files via `git grep -in "TODO\|FIXME\|HACK"`.

Group results by source (file path). Skip completed items (`- [x]`). Be concise — one line per item.
