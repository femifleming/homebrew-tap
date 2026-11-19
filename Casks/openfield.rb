cask "openfield" do
  version "1.4.0"
  sha256 "dfb5891f61d7c83f9e0527a98f0a07d79df3606f9e667cbd9d50541787c3dac7"

  url "https://github.com/femifleming/poppsphere-bundle/releases/download/v#{version}/poppsphere-bundle-macOS.zip"
  name "openfield"
  desc "Openprocess as an Ambisonics encoder (1st-7th order, AmbiX)"
  homepage "https://github.com/femifleming/poppsphere-bundle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "poppsphere-bundle-macOS/openfield/openfield.app"
  audio_unit_plugin "poppsphere-bundle-macOS/openfield/openfield.component"
  audio_unit_plugin "poppsphere-bundle-macOS/openfield/openfield fx.component"
  vst_plugin "poppsphere-bundle-macOS/openfield/openfield.vst"
  vst_plugin "poppsphere-bundle-macOS/openfield/openfield fx.vst"
  vst3_plugin "poppsphere-bundle-macOS/openfield/openfield.vst3"
  vst3_plugin "poppsphere-bundle-macOS/openfield/openfield fx.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "poppsphere-bundle-macOS/openfield"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/openfield.settings"
end
