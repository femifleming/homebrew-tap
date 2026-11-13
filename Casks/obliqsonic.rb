cask "obliqsonic" do
  version "2.2.1"
  sha256 "dacccc37ce61b1ad81c530dcb7b6b8e76661d2609b8ee88fb952d511ac114e61"

  url "https://github.com/femifleming/obliqsound/releases/download/v#{version}/ObliqSonic-App-macOS.zip"
  name "obliqsonic"
  desc "ObliqSound as 3rd-order Ambisonics, for IEM and SPARTA"
  homepage "https://github.com/femifleming/obliqsound"

  livecheck do
    url :url
    strategy :github_latest
  end

  # the app cask brings the plug-ins with it
  depends_on cask: [
    "femifleming/tap/obliqsonic-au",
    "femifleming/tap/obliqsonic-vst3",
  ]
  depends_on :macos

  app "ObliqSonic.app"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "ObliqSonic.app"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/ObliqSonic"
end
