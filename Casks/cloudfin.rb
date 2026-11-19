cask "cloudfin" do
  version "1.3.0,1.2.0"
  sha256 "8f2fa180c4b4e004af6e53e649f177eae70b1555a0ed725e19486669d7f6c076"

  url "https://github.com/femifleming/faltung/releases/download/v#{version.csv.second}/faltung-macOS.zip"
  name "cloudfin"
  desc "Dreamy, floating multi-effect in any order (part of the faltung bundle)"
  homepage "https://github.com/femifleming/faltung"

  # Cloudfin ships inside faltung's releases (two versions: Cloudfin's own, and the faltung release it is in)
  livecheck do
    skip "Released with faltung"
  end

  depends_on :macos

  app "faltung-macOS/Cloudfin/Cloudfin.app"
  audio_unit_plugin "faltung-macOS/Cloudfin/Cloudfin.component"
  vst_plugin "faltung-macOS/Cloudfin/Cloudfin.vst"
  vst3_plugin "faltung-macOS/Cloudfin/Cloudfin.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "faltung-macOS/Cloudfin"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Cloudfin.settings",
    "~/Library/Application Support/FreakiePie/Cloudfin",
  ]
end
