cask "partials" do
  version "1.2.0"
  sha256 "8f2fa180c4b4e004af6e53e649f177eae70b1555a0ed725e19486669d7f6c076"

  url "https://github.com/femifleming/faltung/releases/download/v#{version}/faltung-macOS.zip"
  name "Partials"
  desc "Additive synthesizer with image resynthesis (part of the faltung bundle)"
  homepage "https://github.com/femifleming/faltung"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "faltung-macOS/Partials/Partials.app"
  audio_unit_plugin "faltung-macOS/Partials/Partials.component"
  vst_plugin "faltung-macOS/Partials/Partials.vst"
  vst3_plugin "faltung-macOS/Partials/Partials.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "faltung-macOS/Partials"],
        chdir:        ".",
        must_succeed: false
  end
end
