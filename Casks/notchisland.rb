cask "notchisland" do
  version "1.0.0"
  sha256 "ad76d1be97e47de77ce71d152e3c181d570e4a439ff70bccb84fc328c51ab6fa"

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
