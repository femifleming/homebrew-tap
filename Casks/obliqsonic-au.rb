cask "obliqsonic-au" do
  version "2.2.1"
  sha256 "d202ebbfa822acfce4d55aacb232e3f5d2ecfb43e0dcbe7a431f3ea1c851d874"

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
