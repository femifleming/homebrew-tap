cask "obliqsound-vst3" do
  version "2.2.0"
  sha256 "9b8d816e34a12ee204d5f708b93e2b5d834cce6f2ecfb9f4dc23d4d9f4b6120a"

  url "https://github.com/femifleming/obliqsound/releases/download/v#{version}/ObliqSound-VST3-macOS.zip"
  name "ObliqSound VST3"
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
