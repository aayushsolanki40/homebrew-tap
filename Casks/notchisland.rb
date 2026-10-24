cask "notchisland" do
  version "1.1.0"
  sha256 "5ac61a5b708bebe0b65921f1a0ffc4c5759adf85f30d7a28923eb7d59c4a874d"

  url "https://github.com/aayushsolanki40/NotchIsland/releases/download/v#{version}/NotchIsland.zip"
  name "NotchIsland"
  desc "Dynamic Island-style live activities in the notch"
  homepage "https://github.com/aayushsolanki40/NotchIsland"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "NotchIsland.app"

  # Release builds are ad-hoc signed rather than notarized, so Gatekeeper would
  # block the first launch; clear the quarantine flag Homebrew sets on download.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/NotchIsland.app"],
        writable_paths: ["NotchIsland.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.aayushsolanki.NotchIsland"

  zap trash: "~/Library/Preferences/com.aayushsolanki.NotchIsland.plist"
end
