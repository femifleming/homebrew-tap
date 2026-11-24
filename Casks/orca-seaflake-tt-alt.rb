cask "orca-seaflake-tt-alt" do
  version "0.1.0-beta"
  sha256 "cd53ebaa541677f88bd22361b9ef641ad3727fc614bc8adc1180fb6f9c9c08fe"

  url "https://github.com/femifleming/orca_seaflake/releases/download/teletype-alt-v#{version}/Orca-Seaflake-TT-Alt-macOS-arm64.zip"
  name "Orca Seaflake TT Alt"
  desc "Orca Seaflake for Teletype, alt version (alt+o to stock Teletype screens), beta"
  homepage "https://github.com/femifleming/orca_seaflake/tree/teletype-alt/teletype"

  livecheck do
    skip "Beta, released by hand"
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Orca Seaflake TT Alt.app"

  # ad-hoc signed, not notarised: clear the download quarantine (before it's moved into place) so it opens
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "."],
        chdir:        ".",
        must_succeed: false
  end

  caveats <<~EOS
    Flashing the Teletype needs dfu-programmer:
      brew install dfu-programmer
    Then open Orca Seaflake TT Alt and press cmd+F.
  EOS
end
