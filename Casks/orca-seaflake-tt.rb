cask "orca-seaflake-tt" do
  version "0.1.0-beta"
  sha256 "884ab3d10ff02a2edb5399ffd3d7b33a97e9830c67a692208b8f105bb8c3af43"

  url "https://github.com/femifleming/orca_seaflake/releases/download/teletype-v#{version}/Orca-Seaflake-TT-macOS-arm64.zip"
  name "Orca Seaflake TT"
  desc "Orca Seaflake for monome Teletype: emulator, firmware flasher, help"
  homepage "https://github.com/femifleming/orca_seaflake/tree/teletype-beta/teletype"

  livecheck do
    skip "Beta, released by hand"
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Orca Seaflake TT.app"

  # ad-hoc signed, not notarised: clear the download quarantine (before it's moved into place) so it opens
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "."],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/Orca Seaflake Teletype"

  caveats <<~EOS
    Flashing the Teletype needs dfu-programmer:
      brew install dfu-programmer
    Then open Orca Seaflake TT and press cmd+F.
  EOS
end
