cask "notchisland" do
  version "1.0.1"
  sha256 "1908fbdf6a6493f425ff5cf327dd0bd20fd566b5f704af3c96694901e95ccaba"

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
