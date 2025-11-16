# Lab 02 — Team Workflow with Issues and Projects

## Objectives

By the end of this lab, you should be able to:

- Create and manage GitHub Issues
- Use Labels to categorize issues
- Use GitHub Projects (Kanban board) to track work
- Review and collaborate on Pull Requests

---

## Part 1 — Create Issues

1. Go to the **Issues** tab in your repository.
2. Create at least **2 new issues**. Example ideas:
   - "Improve README formatting"
   - "Add example section to students list"
   - "Fix typo in lab instructions"

3. For each issue:
   - Give it a clear **Title**.
   - Add a short **Description** explaining what needs to be done.

---

## Part 2 — Add Labels

1. On each issue, add appropriate Labels, such as:
   - `documentation`
   - `enhancement`
   - `bug` (if it is a fix)

2. Your instructor may define a label scheme. Follow that if provided.

---

## Part 3 — Create a Project (Kanban Board)

1. Go to the **Projects** tab.
2. Create a **New project**:
   - Template: **Board (Kanban)**
   - Name: `Collaboration Lab Board` (or similar)

3. Add 3 columns (if not created automatically):
   - `To do`
   - `In progress`
   - `Done`

4. Add your issues to the Project and place them in the `To do` column.

---

## Part 4 — Work on an Issue

1. Choose **one** of your issues to work on.
2. Create a new branch for that issue, e.g.:

   ```bash
   git checkout -b feature/<short-issue-name>
