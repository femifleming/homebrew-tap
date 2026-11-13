cask "leitner" do
  version "0.4.0"
  sha256 "18c9de076a03d47d7f106cb68938ef4ad4806d71926efe41cdb9afa0f3615fb4"

  url "https://github.com/femifleming/leitner/releases/download/v#{version}/Leitner-macOS.zip"
  name "leitner"
  desc "Spatialization after Bernhard Leitner and Iannis Xenakis (Ambisonics)"
  homepage "https://github.com/femifleming/leitner"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Leitner/Leitner.app"
  audio_unit_plugin "Leitner/Leitner.component"
  vst3_plugin "Leitner/Leitner.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Leitner/Leitner.app",
                       "Leitner/Leitner.component", "Leitner/Leitner.vst3"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/FreakiePie/Leitner",
    "~/Library/Application Support/Leitner.settings",
  ]
end
