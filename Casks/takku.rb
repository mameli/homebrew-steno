cask "takku" do
  version "1.4.0"
  sha256 "b571d56e6142540104919d8cc5f7e84bcc8dbdeae9aeff9eba8289cfa30ca251"

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
