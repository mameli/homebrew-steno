cask "steno" do
  version "0.2.1"
  sha256 "18e02994e664b68ad7f1aaa36518b7721d550485e0f2f5e9ac8825c15b7bb9c0"

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
