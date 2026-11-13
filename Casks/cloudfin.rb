cask "cloudfin" do
  version "1.2.0"
  sha256 "99514fd79687e4837dd48ad506d570a4a25a45e8e45418cca2e343edcbeaa17a"

  url "https://github.com/femifleming/Cloudfin/releases/download/v#{version}/Cloudfin-macOS.zip"
  name "Cloudfin"
  desc "Dreamy, floating multi-effect in any order"
  homepage "https://github.com/femifleming/Cloudfin"

  depends_on :macos

  app "Cloudfin/Cloudfin.app"
  audio_unit_plugin "Cloudfin/Cloudfin.component"
  vst3_plugin "Cloudfin/Cloudfin.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Cloudfin/Cloudfin.app",
                       "Cloudfin/Cloudfin.component", "Cloudfin/Cloudfin.vst3"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Cloudfin.settings",
    "~/Library/Application Support/FreakiePie/Cloudfin",
  ]
end
