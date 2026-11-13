cask "obliqsonic-vst3" do
  version "2.2.1"
  sha256 "826e71f34c72ee381e5d77a9e804cd604469262490cd6620091e6e09ec100480"

  url "https://github.com/femifleming/obliqsound/releases/download/v#{version}/ObliqSonic-VST3-macOS.zip"
  name "obliqsonic vst3"
  desc "ObliqSound as 3rd-order Ambisonics, for IEM and SPARTA (VST3 plug-in)"
  homepage "https://github.com/femifleming/obliqsound"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  vst3_plugin "ObliqSonic.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "ObliqSonic.vst3"],
        chdir:        ".",
        must_succeed: false
  end
end
