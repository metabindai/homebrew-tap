# homebrew-tap

Homebrew tap for the [Metabind CLI](https://github.com/metabindai/metabind-cli).

## Install

```bash
brew tap metabindai/tap
brew install metabind
metabind --version
```

## Upgrade

```bash
brew update && brew upgrade metabind
```

## How the formula is maintained

`Formula/metabind.rb` is generated. Pushing a `v*` tag to `metabindai/metabind-cli` runs its `.github/workflows/release.yml`, which builds the `darwin-arm64` and `darwin-x64` binaries, publishes them as a GitHub release on this repository, rewrites the formula with the new version and checksums, and merges that change. Do not edit the formula by hand.
