cask "tantri" do
  version "1.2.0"
  sha256 "59af9a36da8a24034386931db3b3645ba6a2fb29573eac95a01401528c1d413a"

  url "https://github.com/femifleming/tantri/releases/download/v#{version}/Tantri-macOS.zip"
  name "Tantri"
  name "Tantri Akasha"
  desc "Sitar, tabla and tanpura physical models with an Ambisonic space instrument"
  homepage "https://github.com/femifleming/tantri"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Tantri-macOS/Tantri/Tantri.app"
  app "Tantri-macOS/Tantri Akasha/Tantri Akasha.app"
  audio_unit_plugin "Tantri-macOS/Tantri/Tantri.component"
  audio_unit_plugin "Tantri-macOS/Tantri Akasha/Tantri Akasha.component"
  audio_unit_plugin "Tantri-macOS/Tantri Akasha/Tantri Akasha FX.component"
  vst_plugin "Tantri-macOS/Tantri/Tantri.vst"
  vst_plugin "Tantri-macOS/Tantri Akasha/Tantri Akasha.vst"
  vst_plugin "Tantri-macOS/Tantri Akasha/Tantri Akasha FX.vst"
  vst3_plugin "Tantri-macOS/Tantri/Tantri.vst3"
  vst3_plugin "Tantri-macOS/Tantri Akasha/Tantri Akasha.vst3"
  vst3_plugin "Tantri-macOS/Tantri Akasha/Tantri Akasha FX.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Tantri-macOS"],
        chdir:        ".",
        must_succeed: false
  end
end
