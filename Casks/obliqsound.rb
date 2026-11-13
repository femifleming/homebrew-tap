cask "obliqsound" do
  version "2.2.0"
  sha256 "60e502270cfb4a156c8acea34adcfbbf8b546bebf764ebc6873ba511a59eb6b8"

  url "https://github.com/femifleming/obliqsound/releases/download/v#{version}/ObliqSound-App-macOS.zip"
  name "obliqsound"
  desc "Polyphonic synth and field-recording instrument with a topographic panel"
  homepage "https://github.com/femifleming/obliqsound"

  livecheck do
    url :url
    strategy :github_latest
  end

  # the app cask brings the plug-ins with it
  depends_on cask: [
    "femifleming/tap/obliqsound-au",
    "femifleming/tap/obliqsound-vst3",
  ]
  depends_on :macos

  app "ObliqSound.app"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "ObliqSound.app"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/ObliqSound"
end
