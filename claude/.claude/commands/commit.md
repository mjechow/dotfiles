# Commit

Update documentation in `*.md` files where necessary.
Run `pre-commit run` on all staged files. If it fails, fix the issues and re-stage.
Once pre-commit passes, create a git commit following the repository's commit message style.

Prefer one commit per topic, but treat that as a limit on effort, not a target. Split only along
whole files: stage the files belonging to one topic, commit, repeat. Make exactly one attempt.

The moment a split resists — a file carries changes from two topics, a staging step picks up the
wrong content, or a commit would not build on its own — stop and put everything in a single commit,
even if it spans three unrelated topics. Then say in one line that the split was not clean and why.

Never spend retries on separating: no `git add -p` hunk selection, no resetting and re-staging, no
editing the index by hand. Churn costs more than an imperfectly grouped commit.
