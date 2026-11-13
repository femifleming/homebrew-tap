cask "obliqsonic-au" do
  version "2.2.0"
  sha256 "b457b12e5d8c821275cc94abf7585c3629542d4b6795d5976859c77579a73f44"

  url "https://github.com/femifleming/obliqsound/releases/download/v#{version}/ObliqSonic-AU-macOS.zip"
  name "obliqsonic au"
  desc "ObliqSound as 3rd-order Ambisonics, for IEM and SPARTA (Audio Unit plug-in)"
  homepage "https://github.com/femifleming/obliqsound"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  audio_unit_plugin "ObliqSonic.component"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "ObliqSonic.component"],
        chdir:        ".",
        must_succeed: false
  end
end
