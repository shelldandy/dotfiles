---
description: Analyze PR review feedback and create comprehensive action plan
---

Switch into plan mode if not there already.

Use `gh` to gather all review feedback for the current branch PR, then:

1. Find the PR number for the current branch
2. Collect all review comments, inline comments, and CI check status
   - **IMPORTANT**: Only include unresolved comments - skip any that are already marked as resolved
   - Check comment resolution status via GitHub API
3. Read all files mentioned in unresolved review comments to understand context
4. Analyze feedback and categorize by priority:

   - Critical: Blocking issues, bugs, broken functionality
   - Medium: Incomplete work, should-fix items
   - Low: Nice-to-haves, clarifications needed

5. Create detailed action plan:
   - Executive summary with main recommendations
   - Issues grouped by priority with checkboxes
   - Proposed solution broken into phases
   - Files affected (keep/modify/revert)
   - Timeline estimates
   - Success criteria
   - Questions for reviewer

The plan should be comprehensive enough to share with reviewers and provide clear, actionable steps to address all unresolved feedback.
