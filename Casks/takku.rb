cask "takku" do
  version "1.14.0"
  sha256 "890753c8f54698ea71a78e19a5f1d54ccb526744b1c29bd7e83329fe30a9a9a5"

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
