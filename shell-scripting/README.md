# Shell Scripting

This folder contains shell scripting learning resources and interview-ready examples.

## Single source of truth

- The canonical cheat sheet content is in `shell-scripting/cheat-sheet.md`.
- The published docs page at `shell-scripting/cheat-sheet.html` is generated from this markdown by the repository Pages workflow.

Note: Single Source of Truth — edit only `shell-scripting/cheat-sheet.md` for content changes.
The HTML files under `docs/` are generated outputs. Any content edits must be done in the markdown source; regenerating HTML (via `./scripts/generate_cheatsheets.sh` or the Pages workflow) will update the published pages.

Important: The generation script will never overwrite an existing HTML file. If you need to regenerate a page that was manually edited, delete the target HTML file first, then run the generator.

## Contents

- `cheat-sheet.md` — shell scripting reference and interview-ready notes.
- `programs.md` — corrected shell script examples.
 - `devops-scripting-questions.md` — focused DevOps interview questions and practice tasks.
