# Open Tasks

Find all open tasks in the current working context:

1. Look for `todo.md` files in the current project directory and any additional working directories.
   Read each one and extract all unchecked items (`- [ ]`).
2. Search for `TODO`, `FIXME`, and `HACK` markers in tracked source files via `git grep -in "TODO\|FIXME\|HACK"`.
3. Also treat items marked as open without a checkbox as todos (e.g. a status column or legend in a
   table or list: everything not marked done). Check the project's index/README files for such
   status conventions.

Group results by source (file path). Skip completed items (`- [x]`, marked done). Be concise — one line per item.
