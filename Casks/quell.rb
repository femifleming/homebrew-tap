cask "quell" do
  version "1.2.0"
  sha256 "bd13e0b11bcbc6e77b71430ec3774ec978f041766910edaf200625d29ccccbd9"

  url "https://github.com/femifleming/poppsphere-bundle/releases/download/v#{version}/poppsphere-bundle-macOS.zip"
  name "quell"
  desc "Dynamic resonance suppressor"
  homepage "https://github.com/femifleming/poppsphere-bundle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "poppsphere-bundle-macOS/Quell/Quell.app"
  audio_unit_plugin "poppsphere-bundle-macOS/Quell/Quell.component"
  vst_plugin "poppsphere-bundle-macOS/Quell/Quell.vst"
  vst3_plugin "poppsphere-bundle-macOS/Quell/Quell.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "poppsphere-bundle-macOS/Quell"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/Quell.settings"
end
