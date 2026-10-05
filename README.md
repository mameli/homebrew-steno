# Homebrew tap for Steno

[Steno](https://github.com/mameli/steno) is a macOS menu bar app that records your meetings, transcribes them on your Mac and writes the Transcript and a Summary into your Obsidian vault.

```sh
brew install --cask mameli/steno/steno
```

Steno is signed but not notarized by Apple: the first time you open it, macOS blocks it. Press **Done**, then go to **System Settings → Privacy & Security** and press **Open Anyway**. Do this again after every `brew upgrade`.

Uninstall with `brew uninstall --cask steno`; add `--zap` to also delete Steno's settings, recordings and transcription models. Your notes in the Obsidian vault and the API keys in the Keychain are not touched.

The cask is updated by `scripts/release.sh` in the Steno repository at every release.
