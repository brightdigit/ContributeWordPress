#!/usr/bin/env bash
# Ensure Package.swift uses remote URL deps for standalone CI.
# Monorepo builds keep .package(path:); CI rewrites to url+revision before
# swift build (SundialKitStream / setup-sundialkit pattern).
set -euo pipefail

PACKAGE_FILE="Package.swift"

if [[ ! -f "$PACKAGE_FILE" ]]; then
  echo "❌ Package.swift not found"
  exit 1
fi

# Escape a path string for use on the left-hand side of a sed |…| substitution
# (dots in ../ must be literal).
escape_sed_path() {
  printf '%s' "$1" | sed 's/\./\\./g'
}

rewrite_dep() {
  local name="$1"
  local relpath="$2"
  local url="$3"
  local branch="$4"

  if grep -q "\.package(url: \"$url\"" "$PACKAGE_FILE"; then
    echo "✅ $name already using remote dependency"
    return 0
  fi

  if ! grep -q "\.package(name: \"$name\", path: \"$relpath\")" "$PACKAGE_FILE"; then
    echo "⚠️  $name path dependency not found in Package.swift"
    return 1
  fi

  local ref req
  ref=$(git ls-remote "$url" "$branch" | head -n1 | cut -f1 || true)
  if [[ -n "$ref" ]]; then
    req="revision: \"$ref\""
    echo "🔄 Pinning $name to $branch @ $ref"
  else
    req="branch: \"$branch\""
    echo "⚠️  Could not resolve $branch for $name; pinning by branch"
  fi

  local path_esc pattern replacement
  path_esc=$(escape_sed_path "$relpath")
  pattern="\\.package(name: \"$name\", path: \"$path_esc\")"
  replacement=".package(url: \"$url\", $req)"

  if [[ "$(uname -s)" == Darwin* ]]; then
    sed -i '' "s|$pattern|$replacement|g" "$PACKAGE_FILE"
  else
    sed -i "s|$pattern|$replacement|g" "$PACKAGE_FILE"
  fi
  echo "✅ Switched $name to remote dependency"
}

rewrite_dep "Contribute" "../../BrightDigit/Contribute" \
  "https://github.com/brightdigit/Contribute.git" \
  "${CONTRIBUTE_BRANCH:-brightdigit-com-260621}"

rewrite_dep "SyndiKit" "../../BrightDigit/SyndiKit" \
  "https://github.com/brightdigit/SyndiKit.git" \
  "${SYNDIKIT_BRANCH:-brightdigit-com-260621}"

rm -f Package.resolved
