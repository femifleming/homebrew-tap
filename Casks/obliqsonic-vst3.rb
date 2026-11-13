cask "obliqsonic-vst3" do
  version "2.2.0"
  sha256 "d4559623068eb8fb110f0871f5e931ed230f4a093001ee139e12b6de3cc98408"

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
