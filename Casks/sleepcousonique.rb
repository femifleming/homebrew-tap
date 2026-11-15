cask "sleepcousonique" do
  version "1.2.0"
  sha256 "d6bd277e784c3c0f068a09f963a5a504d181bc859d1808fb6b20cd48b1eecdc3"

  url "https://github.com/femifleming/sleepcousonique/releases/download/v#{version}/sleepcousonique-macOS.zip"
  name "sleepcousonique"
  desc "Dream-journal patch language and modular editor for the Teenage Engineering SP-1"
  homepage "https://github.com/femifleming/sleepcousonique"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "sleepcousonique-macOS/Sleepcousonique.app"
  app "sleepcousonique-macOS/Sleepcousonique Array.app"

  # ad-hoc signed, not notarised: clear the download quarantine (before it's moved into place) so it opens
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "sleepcousonique-macOS"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Sleepcousonique",
    "~/Library/Application Support/Sleepcousonique.settings",
    "~/Library/Preferences/com.sleepcousonique.editor.plist",
  ]

  caveats <<~EOS
    The SP-1 firmware (sleepcousonique-sp1.bin), the manual and FLASHING.txt are on the release page:
      https://github.com/femifleming/sleepcousonique/releases
    Flash it once: SP-1 off, hold T1 + T4, plug in USB, then flash the .bin at solderless.engineering.
  EOS
end
