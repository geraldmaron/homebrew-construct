# homebrew-construct

Homebrew tap for [Construct](https://github.com/geraldmaron/construct) — a local-first agent orchestration layer for AI coding tools.

## Install

```bash
brew install geraldmaron/construct/construct
construct setup
```

## How this tap is maintained

`Formula/construct.rb` is bumped automatically by the construct repo's release workflow on every `v*` tag — the per-platform `url` and `sha256` fields point at the matching GitHub Release SEA binaries with verified digests.
