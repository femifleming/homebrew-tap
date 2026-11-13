cask "leitner" do
  version "0.3.0"
  sha256 "44906de8ebb9840e5c7293364b75b4d950657a327dea5d8285cf936bf84f51e5"

  url "https://github.com/femifleming/Leitner/releases/download/v#{version}/Leitner-macOS.zip"
  name "Leitner"
  desc "Spatialization after Bernhard Leitner and Iannis Xenakis (Ambisonics)"
  homepage "https://github.com/femifleming/Leitner"

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
