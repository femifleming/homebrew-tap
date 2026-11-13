cask "pilot-sealflake" do
  version "1.1.1,0.10.2"
  sha256 "e0865a84390ff8b7576862c39294e10a42146a90cdb3f46cf3c38fd5702d4c6c"

  url "https://github.com/femifleming/orca_seaflake/releases/download/v#{version.csv.second}/Pilot-Sealflake-#{version.csv.first}-macos.zip"
  name "pilot sealflake"
  desc "Synth for Orca with Teletype and Just Friends built in"
  homepage "https://github.com/femifleming/orca_seaflake/tree/main/pilot"

  # Pilot ships inside Orca Seaflake's releases (two versions): scripts/update-homebrew.sh in the repo bumps it
  livecheck do
    skip "Released with Orca Seaflake"
  end

  depends_on :macos

  app "Pilot Sealflake #{version.csv.first}/Pilot Sealflake.app"
  audio_unit_plugin "Pilot Sealflake #{version.csv.first}/Pilot Sealflake.component"
  vst3_plugin "Pilot Sealflake #{version.csv.first}/Pilot Sealflake.vst3"

  # ad-hoc signed, not notarised: clear the download quarantine (before they're moved into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "."],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Pilot Sealflake",
    "~/Library/Application Support/Pilot Sealflake.settings",
  ]
end
