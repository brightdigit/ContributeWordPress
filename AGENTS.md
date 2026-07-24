# AGENTS.md

This is the canonical agent instruction file for this repository. `CLAUDE.md` is a symlink to it.

## Overview

**ContributeWordPress** is a Swift package (SPM) that imports a WordPress export — the WXR/XML
file plus the site's uploaded assets — into a [Publish](https://github.com/JohnSundell/Publish)
site as Markdown files with YAML front matter.

Two products:

- `ContributeWordPress` — the library.
- `wpublish` — a thin executable wrapper (`Sources/wpublish/WPublish.swift`) that takes
  `<export-dir> <publish-root> [wordpress-files-dir]` on the command line. It is a `@main`
  type rather than top-level code in `main.swift` because importing is now `async`, and
  top-level code cannot `await`.

It builds on the [`Contribute`](https://github.com/brightdigit/Contribute) pipeline
(`MarkdownContentBuilder`, `FrontMatterTranslator`, `ContentURLGenerator`) and decodes the
WordPress export with [`SyndiKit`](https://github.com/brightdigit/SyndiKit)'s `WordPressPost` /
`RSSChannel` models.

## Commands

Builds with the **Swift 6.4 toolchain** (`.swift-version` → `6.4.x-snapshot`; tools-version 6.4,
Swift 6 language mode). Use the matching snapshot or `Xcode-beta` toolchain locally.

- Build: `swift build`
- Build incl. tests: `swift build --build-tests`
- Run tests: `swift test`
- Run one test class: `swift test --filter ContributeWordPressTests.SettingsTests`

### Linting

Lint tooling is pinned via **mise** (`.mise.toml`). The canonical entry point is
`Scripts/lint.sh`, which bootstraps tools with `mise install` then runs swift-format, SwiftLint,
and a build check; the license-header rewrite (`Scripts/header.sh`) and periphery run locally
only.

- Full lint + autofix (local): `Scripts/lint.sh`
- Format only: `FORMAT_ONLY=1 Scripts/lint.sh`
- CI/strict mode (no autofix, fails on warnings): `LINT_MODE=STRICT CI=1 Scripts/lint.sh`

Notes: `Scripts/header.sh` is invoked with `-p "ContributeWordPress"` — that argument is
package-specific; never overwrite `Scripts/lint.sh` wholesale from another package. Periphery
needs `-- --build-system native` because Swift 6.4's default `swiftbuild` build system writes its
index store where periphery 3.7.4 does not look. SwiftLint config is strict (`explicit_acl`,
`force_unwrapping`, small `file_length`) — keep ACLs explicit and files small.

## Architecture

`Sources/ContributeWordPress/` is grouped by pipeline stage:

- **`Decoder/`** — turns the exported XML into `WordPressSite` values.
  `SitesExportDecoder` is the protocol; `SitesExportSynDecoder` is the SyndiKit-backed
  implementation, and it handles a directory containing *multiple* WXR files (multi-site
  exports).
- **`Contribute/`** — the seam onto the `Contribute` library: `Source` (the source model),
  `SpecFrontMatterTranslator` + `Specs` (front matter mapping), and
  `SectionContentURLGenerator` (destination path per post, keyed by site → section).
- **`PostFilters/`** — `PostFilter` and `RegexKeyPostFilter`. The default filters keep only
  `type == post` and `status == publish`.
- **`Images/`** — asset handling. `AssetImportSetting` selects `.none`, `.download` (pull from
  the live site), or `.copyFilesFrom(URL)` (copy from a local backup). `AssetDownloader` /
  `Downloader` / `AssetImportFactory` do the work; `WordPressError` carries the failure cases.
- **`Redirects/`** — old-URL → new-URL emission. `RedirectFormatter` (only
  `NetlifyRedirectFormatter` ships), `RedirectListGenerator` / `DynamicRedirectGenerator`, and
  `RedirectFileWriter` / `DynamicRedirectFileWriter`. Nothing is written unless a formatter is
  supplied.
- **`Processing/`** — the orchestrator. `MarkdownProcessor` is generic over a
  `ContentURLGenerator` and a `MarkdownContentBuilder`, both pinned to `Source`.
  `MarkdownProcessor+Begin` / `+Starter` provide the `beginImport(from:to:...)` conveniences that
  the README and `wpublish` use; `Settings` / `ProcessorSettings` / `PublishDefaults` describe
  the Publish site layout.

Almost every type behind a stage is a protocol, so extending usually means adding a conforming
type rather than editing an existing one.

Non-Apple platforms: several files are guarded with
`#if canImport(FoundationNetworking) import FoundationNetworking #endif`. **Preserve those
guards** — Linux, Windows, and Android are all built in CI.

## Tests

XCTest-based, in `Tests/ContributeWordPressTests/`. The suite is built on hand-written
**Spy**, **Stub**, and **Fake** helpers under `Helpers/` (one type per protocol seam) rather
than a mocking framework — match that style.

`Data/` at the repository root holds the fixture bodies (`WPExport`, `PodcastingContent`,
`MyYearInReviewContent.txt`, …). They are loaded at runtime by
`Tests/ContributeWordPressTests/Helpers/Extension/FakeData/String+Fake.swift`, which walks up
from `#filePath` to the repo root and reads every file in `Data/`. **Do not move, rename, or
delete anything in `Data/`** — it is not dead weight, and the loader `precondition`s on the
directory existing.

## CI

`.github/workflows/ContributeWordPress.yml` is the shared BrightDigit template — the filename
casing must match the package name, because the README's Actions badge URL embeds it. It builds
on Ubuntu (nightly-6.4 container), macOS + Apple platform simulators (Xcode 27 / Swift 6.4),
Windows, and Android. Five auxiliary workflows (`check-unsafe-flags`, `claude-code-review`,
`claude`, `cleanup-caches`, `swift-source-compat`) are kept byte-identical with the other
BrightDigit packages; sync rather than fork them.

## Dependencies

`Contribute` and `SyndiKit` are consumed as remote SPM dependencies. During the de-vendoring
release checkpoint they are pinned to `branch: "main"`; they move to released tags as those
packages ship.

## Memory & Corrections Convention

`.claude/agent-notes.md` is the canonical, versioned corrections log for this repository — an
append-only record of the maintainer's corrections and standing **always/never** directives.

- **Read `.claude/agent-notes.md` at the start of every work session, before doing any work.** It
  is the source of truth for *how* to work in this repo.
- **Whenever the maintainer makes a correction or gives an always/never instruction, append one
  line to `.claude/agent-notes.md` proactively (without being asked).** One line per directive,
  newest at the bottom. If a directive supersedes an earlier one, update or remove the stale line
  rather than leaving both.
