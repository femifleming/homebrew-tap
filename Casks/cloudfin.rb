cask "cloudfin" do
  version "1.2.1"
  sha256 "381a3ae5bdd0030fa6ca27185f4002c8b35d21284588c4999864fffa143836c2"

  url "https://github.com/femifleming/cloudfin/releases/download/v#{version}/Cloudfin-macOS.zip"
  name "cloudfin"
  desc "Dreamy, floating multi-effect in any order"
  homepage "https://github.com/femifleming/cloudfin"

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
