cask "sleepcousonique" do
  version "1.1.0"
  sha256 "2c80c75d82348839bfa0d05b3441aea7677c1427a72cc26d31e66f838a59ea1e"

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

  # ad-hoc signed, not notarised: clear the download quarantine (before it's moved into place) so it opens
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "sleepcousonique-macOS"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Sleepcousonique.settings",
    "~/Library/Preferences/com.sleepcousonique.editor.plist",
  ]

  caveats <<~EOS
    The SP-1 firmware (sleepcousonique-sp1.bin), the manual and FLASHING.txt are on the release page:
      https://github.com/femifleming/sleepcousonique/releases
    Flash it once: SP-1 off, hold T1 + T4, plug in USB, then flash the .bin at solderless.engineering.
  EOS
end
