cask "obliqsound-au" do
  version "2.2.1"
  sha256 "841cfb38321153c9843fc1085fda2878e734e60718876320987b400b24cbcc21"

  url "https://github.com/femifleming/obliqsound/releases/download/v#{version}/ObliqSound-AU-macOS.zip"
  name "obliqsound au"
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
