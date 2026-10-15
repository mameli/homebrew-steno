cask "takku" do
  version "1.3.1"
  sha256 "ae0a7b73e2c7240809549078069c4ef18b16941cb512e0acb99d8b16d91cda4f"

  url "https://github.com/mameli/Takku/releases/download/v#{version}/Takku-#{version}.zip"
  name "Takku"
  desc "Records meetings, transcribes them locally and writes notes to Obsidian"
  homepage "https://takku.app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Takku.app"

  uninstall quit: "app.takku.takku"

  # Takku was called Steno until 0.2.1: its leftovers go too.
  zap trash: [
    "~/Library/Application Support/Steno",
    "~/Library/Application Support/Takku",
    "~/Library/Caches/app.takku.takku",
    "~/Library/Caches/dev.mameli.steno",
    "~/Library/HTTPStorages/app.takku.takku",
    "~/Library/HTTPStorages/dev.mameli.steno",
    "~/Library/Preferences/app.takku.takku.plist",
    "~/Library/Preferences/dev.mameli.steno.plist",
  ]
end
