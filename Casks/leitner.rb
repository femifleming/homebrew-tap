cask "leitner" do
  version "0.4.1"
  sha256 "8fd2f7d8ff75afa82e3d4d27d1291737718d6b6a2dcbeab8a16d7c6fb42de5f8"

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
