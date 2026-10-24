# Homebrew Tap

Homebrew casks for apps by [@aayushsolanki40](https://github.com/aayushsolanki40).

## Install

```bash
brew install --cask aayushsolanki40/tap/notchisland
```

Or tap once, then install by name:

```bash
brew tap aayushsolanki40/tap
brew install --cask notchisland
```

## Casks

| Cask | App | Description |
|---|---|---|
| [`notchisland`](Casks/notchisland.rb) | [NotchIsland](https://github.com/aayushsolanki40/NotchIsland) | iPhone-style Dynamic Island for the Mac notch |

## Updating

```bash
brew update && brew upgrade --cask notchisland
```

## Uninstalling

```bash
brew uninstall --cask notchisland        # remove the app
brew uninstall --zap --cask notchisland  # also remove its preferences
```

## Notes

NotchIsland release builds are ad-hoc signed, not notarized. The cask clears the macOS quarantine
flag after install so the app opens without a Gatekeeper warning.

## Maintaining (new release)

1. Publish the release on GitHub with `NotchIsland.zip` attached.
2. Update `version` and `sha256` in `Casks/notchisland.rb`
   (`shasum -a 256 NotchIsland.zip`), or run
   `brew bump-cask-pr --version <x.y.z> aayushsolanki40/tap/notchisland`.
3. Commit and push.
