cask "steno" do
  version "0.1.0"
  sha256 "6684141d1062ecc73ae61c007880589825db1f6b764cef7db7456cf1b9b03113"

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
