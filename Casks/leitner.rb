cask "leitner" do
  # Leitner is released together with Cloudfin, under Cloudfin's version tag
  version "0.2.0"
  sha256 "92c36573d83f2acc12362d96fa193ef7ea64c51adf4478ec306c18e89b78db85"

  url "https://github.com/femifleming/Cloudfin/releases/download/v1.2.0/Leitner-macOS.zip"
  name "Leitner"
  desc "Cloudfin as a sound space: an Ambisonics encoder, 3rd to 7th order"
  homepage "https://github.com/femifleming/Cloudfin/tree/main/Leitner"

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
