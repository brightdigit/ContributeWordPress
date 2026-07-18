# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

ContributeWordPress is a Swift library (plus `wpublish` executable) that turns WordPress content into Markdown files with YAML front matter, using the `Contribute` pipeline and SyndiKit.

## Commands

Builds with the **Swift 6.4 toolchain** (`.swift-version` → `6.4.x-snapshot`). Use the matching snapshot / `Xcode-beta` toolchain locally.

- Build: `swift build`
- Build incl. tests: `swift build --build-tests`
- Run tests: `swift test`

### Linting

Lint tooling is pinned via **mise** (`.mise.toml`). The entry point is `Scripts/lint.sh`, which bootstraps tools with `mise install` then runs swift-format, SwiftLint, and a build check (periphery + header rewrite run locally only).

- Full lint + autofix (local): `Scripts/lint.sh`
- CI/strict mode (no autofix, fails on warnings): `LINT_MODE=STRICT CI=1 Scripts/lint.sh`

## Dependencies

Depends on sibling `Contribute` and `SyndiKit`, resolved in-place via relative paths in the monorepo; standalone CI rewrites them to remote URLs via `Scripts/ensure-remote-deps.sh`.
