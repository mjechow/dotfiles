# Commit

Update documentation in `*.md` files where necessary.
If the repository has a `.pre-commit-config.yaml`, run `pre-commit run` on the staged files. If it fails,
fix the issues and re-stage. Then create a git commit following the repository's commit message style.

Prefer one commit per topic, but treat that as a limit on effort, not a target. Split along whole files
where possible; use hunks (`git add -p`) only for a file that carries changes from more than one topic.

Make at most three attempts at a split. An attempt fails when hunks cannot be separated cleanly, a staging
step picks up the wrong content, or a commit would not build on its own. After the third failed attempt,
put everything in a single commit, even if it spans unrelated topics, and say in one line that the split
was not clean and why. Churn costs more than an imperfectly grouped commit.
