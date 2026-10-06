cask "steno" do
  version "0.1.2"
  sha256 "e695131aca7c2b401d6f5de4aa8a87622f5b7dda7911a7e0b9f3491e9161fb0b"

  url "https://github.com/mameli/steno/releases/download/v#{version}/Steno-#{version}.zip"
  name "Steno"
  desc "Records meetings, transcribes them locally and writes notes to Obsidian"
  homepage "https://github.com/mameli/steno"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Steno.app"

  uninstall quit: "dev.mameli.steno"

  zap trash: [
    "~/Library/Application Support/Steno",
    "~/Library/Caches/dev.mameli.steno",
    "~/Library/HTTPStorages/dev.mameli.steno",
    "~/Library/Preferences/dev.mameli.steno.plist",
  ]

  caveats <<~EOS
    Steno is signed but not notarized by Apple, so macOS blocks it the first time it opens:
    press Done, then go to System Settings → Privacy & Security and press Open Anyway.
    Do this again after every upgrade.
  EOS
end
