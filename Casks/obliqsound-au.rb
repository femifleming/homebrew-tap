cask "obliqsound-au" do
  version "2.2.0"
  sha256 "f272793c5bcdf8f26d4d189e6c0f7eac1d92f4b4b1b88e7964d333cfa1f3cf19"

  url "https://github.com/femifleming/obliqsound/releases/download/v#{version}/ObliqSound-AU-macOS.zip"
  name "ObliqSound AU"
  desc "Synth and field-recording instrument (Audio Unit plug-in)"
  homepage "https://github.com/femifleming/obliqsound"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  audio_unit_plugin "ObliqSound.component"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "ObliqSound.component"],
        chdir:        ".",
        must_succeed: false
  end
end
