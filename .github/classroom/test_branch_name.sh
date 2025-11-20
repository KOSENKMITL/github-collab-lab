#!/usr/bin/env bash
set -euo pipefail

# Robustly determine branch name in local and GitHub Actions environments.
get_branch() {
  # 1) GitHub Actions: prefer explicit variables (best for PR and push events)
  if [ -n "${GITHUB_HEAD_REF:-}" ]; then
    echo "$GITHUB_HEAD_REF"
    return
  fi
  if [ -n "${GITHUB_REF_NAME:-}" ]; then
    echo "$GITHUB_REF_NAME"
    return
  fi
  if [ -n "${GITHUB_REF:-}" ]; then
    case "$GITHUB_REF" in
      refs/heads/*) echo "${GITHUB_REF#refs/heads/}" ; return ;;
      # refs/pull/*/head or refs/pull/*/merge: GITHUB_HEAD_REF should have handled PR branch name.
      # Fallthrough to git-based discovery if needed.
      *) echo "${GITHUB_REF#refs/}" ; return ;;
    esac
  fi

  # 2) Local git repository
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    # Normal case: a named branch checked out
    branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || true)"
    if [ -n "$branch" ] && [ "$branch" != "HEAD" ]; then
      echo "$branch"
      return
    fi

    # Detached HEAD: try to find any local or remote refs pointing at HEAD (first match)
    branch="$(git for-each-ref --format='%(refname:short)' --points-at HEAD refs/heads refs/remotes 2>/dev/null | sed -n '1p' || true)"
    if [ -n "$branch" ]; then
      # If it's a remote ref like origin/feature/..., strip the remote part
      echo "${branch#*/}"
      return
    fi

    # Last fallback: name-rev (may return something like origin/branch~1)
    branch="$(git name-rev --name-only HEAD 2>/dev/null || true)"
    if [ -n "$branch" ]; then
      echo "$branch" | sed 's#^remotes/##; s#~.*##' # remove remotes/ prefix and any ~N suffix
      return
    fi
  fi

  # Nothing found
  echo ""
}

BRANCH="$(get_branch)"

if [ -z "$BRANCH" ]; then
  echo "FAIL: could not determine branch name"
  exit 1
fi

if [[ "$BRANCH" == feature/add-name-* ]]; then
  echo "PASS: Branch name follows feature/add-name-* convention ($BRANCH)"
  exit 0
else
  echo "FAIL: Branch name '$BRANCH' does not follow feature/add-name-* convention"
  exit 1
fi
