cask "sleepcousonique" do
  version "1.5.0"
  sha256 "5059266951a621687ae6c3821293d86d00790190202ac2e3a939780f8095a2fc"

  url "https://github.com/femifleming/sleepcousonique/releases/download/v#{version}/sleepcousonique-macOS.zip"
  name "sleepcousonique"
  desc "Dream-journal patch language and editor for the SP-1 and Wingie2"
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
    It restarts switched off (standby): hold the •• button about half a second to turn it on, then send.
    The Wingie2 firmware (sleepcousonique-wingie.bin, GPLv3) and its manual are there too:
    write it at 0x0 with esptool (see the Wingie manual); Meng Qi's web flasher puts stock back.
  EOS
end
