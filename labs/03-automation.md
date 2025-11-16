# Lab 03 — Automation with GitHub Actions and Protected Branches

## Objectives

By the end of this lab, you should be able to:

- Understand the idea of protected branches
- Observe a GitHub Actions workflow running on a Pull Request
- Create a simple release with a tag

> Note: Some steps may require instructor permissions (e.g., branch protection).

---

## Part 1 — Explore the CI Workflow

1. Open the file:

   `.github/workflows/hello-ci.yml`

2. Read and understand the workflow:
   - When does it run?
   - What does it do?

3. Answer these questions for yourself (or in your report):
   - On which event(s) is the workflow triggered?
   - What job(s) does the workflow run?
   - What steps are executed?

---

## Part 2 — Trigger the Workflow

1. Create a new branch and make a small change, for example:

   - Edit `README.md` and add a line at the bottom:
     ```markdown
     CI test: updated by <your-name>
     ```

2. Commit and push your changes:

   ```bash
   git add README.md
   git commit -m "Test CI workflow"
   git push -u origin <your-branch-name>
