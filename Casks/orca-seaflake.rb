cask "orca-seaflake" do
  arch arm: "arm64", intel: "x64"

  version "0.10.2"
  sha256 arm:   "9b81f6f5d8980ede0c5f7fb1c48c34c6cd4c67bef778c037b218231a9a054e49",
         intel: "92488617a86f870971f20908da25e8033e01d049cbb7ba54666bc3b9c08beab4"

  url "https://github.com/femifleming/orca_seaflake/releases/download/v#{version}/Orca-Seaflake-#{version}-darwin-#{arch}.zip"
  name "orca seaflake"
  desc "Live-coding grid sequencer for MIDI, OSC and UDP"
  homepage "https://github.com/femifleming/orca_seaflake"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Orca-Seaflake.app"

  # ad-hoc signed, not notarised: clear the download quarantine so it opens
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Orca-Seaflake.app"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Orca Seaflake",
    "~/Library/Preferences/com.femifleming.orcaseaflake.plist",
  ]
end
