cask "orca-seaflake-tt" do
  version "0.1.0-beta"
  sha256 "1a2c661e46d7b4f44ecd1a3aa4762dc349524c4de6ae4ce3fb7158fa044dbf51"

  url "https://github.com/femifleming/orca_seaflake/releases/download/teletype-v#{version}/Orca-Seaflake-TT-macOS-arm64.zip"
  name "Orca Seaflake TT"
  desc "Orca Seaflake for monome Teletype: emulator, firmware flasher, help (beta)"
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
