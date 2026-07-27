# Release Notes

## 2.0.0-alpha.1

ContributeWordPress moves to Swift 6.4 with complete strict concurrency. The asset-download
path is now structured concurrency rather than GCD, which makes `Downloader.download` and
`MarkdownProcessor.begin` `async throws` — a source-breaking change for direct callers, hence
the major version bump from `1.0.0`.

### Library
* Swift 6.4 support, in-process HTML-to-Markdown, and mise-based linting by @leogdion in https://github.com/brightdigit/ContributeWordPress/pull/18
* Replace `AssetDownloader`'s `DispatchGroup` fan-out and its unsynchronized `[URL: Error]` dictionary with `withThrowingTaskGroup`, fixing a real data race — each child returns its own result and the parent collects at the join point, so `AssetDownloadErrors.swift` is deleted rather than lock-guarded by @leogdion in https://github.com/brightdigit/ContributeWordPress/pull/18
* Make `Downloader.download` and `MarkdownProcessor.begin` `async throws` by @leogdion in https://github.com/brightdigit/ContributeWordPress/pull/18
* Convert `Sources/wpublish/main.swift` into a `@main` type in `WPublish.swift`, since top-level code cannot `await` by @leogdion in https://github.com/brightdigit/ContributeWordPress/pull/18

### Tests
* Turn the `FileDownloaderSpy` and `AssetDownloaderSpy` test doubles into actors, removing two more `NSLock`s by @leogdion in https://github.com/brightdigit/ContributeWordPress/pull/18
* Add a regression test that fans out 200 failing downloads and asserts every error survives by @leogdion in https://github.com/brightdigit/ContributeWordPress/pull/18

### Tooling & CI
* Raise `.swift-version` to the `6.4.x-snapshot` toolchain, matching the rest of the stack by @leogdion in https://github.com/brightdigit/ContributeWordPress/pull/18
* Move linting to mise with `.mise.toml`, `.swift-format`, `.swiftlint.yml` and `Scripts/lint.sh` by @leogdion in https://github.com/brightdigit/ContributeWordPress/pull/18

**Full Changelog**: https://github.com/brightdigit/ContributeWordPress/compare/1.0.0...2.0.0-alpha.1
