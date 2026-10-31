cask "takku" do
  version "1.12.0"
  sha256 "7d71fba2a3cc4d6ab62b77e0ebd000ed725aea6ae0eccee0d961b518553a978c"

  url "https://github.com/mameli/Takku/releases/download/v#{version}/Takku-#{version}.dmg"
  name "Takku"
  desc "Records meetings, transcribes them locally and writes Markdown notes"
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
