# Homebrew tap for Takku

[Takku](https://github.com/mameli/Takku) is a macOS menu bar app that records your meetings, transcribes them on your Mac and writes the Transcript and a Summary into your Obsidian vault.

```sh
brew install --cask mameli/takku/takku
```

Takku is signed but not notarized by Apple: the first time you open it, macOS blocks it. Press **Done**, then go to **System Settings → Privacy & Security** and press **Open Anyway**. Do this again after every `brew upgrade`.

Uninstall with `brew uninstall --cask takku`; add `--zap` to also delete Takku's settings, recordings and transcription models. Your notes in the Obsidian vault and the API keys in the Keychain are not touched.

Takku was called Steno until 0.2.1: `brew upgrade` replaces the `steno` cask with `takku` (`cask_renames.json`).

The cask is updated by `scripts/release.sh` in the Takku repository at every release.
