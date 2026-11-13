cask "obliqsound-vst3" do
  version "2.2.1"
  sha256 "9b1569ed4c324c5a3362b1a4617826c7135273318e69e070ec2e760a397b390b"

  url "https://github.com/femifleming/obliqsound/releases/download/v#{version}/ObliqSound-VST3-macOS.zip"
  name "obliqsound vst3"
  desc "Synth and field-recording instrument (VST3 plug-in)"
  homepage "https://github.com/femifleming/obliqsound"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  vst3_plugin "ObliqSound.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "ObliqSound.vst3"],
        chdir:        ".",
        must_succeed: false
  end
end
