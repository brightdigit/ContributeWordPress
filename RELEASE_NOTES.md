# Release Notes

## Unreleased

Wave 1 de-vendoring (brightdigit/ContributeWordPress #18, head `brightdigit-com-260406`) — the
package leaves the `brightdigit.com` monorepo and becomes a standalone repository built on its
own CI.

### Library

- Raised the Swift tools version to 6.4 and adopted the Swift 6 language mode with complete
  strict-concurrency checking.
- Raised the Apple platform floors to macOS 15 / iOS 16 / tvOS 16 / watchOS 9 (required by
  `Synchronization.Mutex` in the dependency stack).
- `Contribute` and `SyndiKit` are now consumed as remote SPM dependencies pinned to `main`,
  replacing the monorepo `path:` dependencies and the `Scripts/ensure-remote-deps.sh` rewrite
  that supported them.
- Applied the shared BrightDigit source-header, swift-format, and SwiftLint style to every file
  in `Sources/`.

### Tests

- Ported the XCTest suite to the Swift 6 language mode: spies, stubs, and fakes updated for
  strict concurrency, and `URL(_:)` test helpers renamed to `URL(staticString:)` to avoid an
  initializer ambiguity on macOS.
- `Data/` fixtures are unchanged; they are still loaded at runtime from the repository root by
  `String+Fake.swift`.

### CI

- Adopted the shared BrightDigit workflow set: `ContributeWordPress.yml` (Ubuntu, macOS, Apple
  platform simulators, Windows, Android) plus `check-unsafe-flags`, `claude-code-review`,
  `claude`, `cleanup-caches`, and `swift-source-compat`, and the `setup-tools` composite action
  that caches mise tool installs.
- The main workflow filename now matches the package name so the README Actions badge resolves.
- `fail-fast: true` on all four matrix legs; the Ubuntu coverage step uses
  `sersoft-gmbh/swift-coverage-action@v5`; Codecov steps drop `verbose`.
- `build-macos-platforms` adds visionOS and drops the `ENABLE_WATCHOS` gate on the watchOS row.
- `.swift-version` moved from `5.8` to `6.4.x-snapshot`, and `.spi.yml` from `swift_version: 5.9`
  to `"6.4"` (also fixing a misspelled `documentation_targets` entry).
- Devcontainer moved to `swiftlang/swift:nightly-6.4.x-noble` with a pinned
  `devcontainer-lock.json`; added `.github/dependabot.yml`.
- Removed `Mintfile`, `project.yml`, and `Scripts/gh-md-toc` — lint tooling is pinned via mise
  (`.mise.toml`) and driven by `Scripts/lint.sh`.
- Added `AGENTS.md` (with `CLAUDE.md` as a symlink to it), `.claude/agent-notes.md`, and the
  shared `.claude/skills/` set.
