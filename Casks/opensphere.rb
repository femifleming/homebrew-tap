cask "opensphere" do
  version "1.1.0"
  sha256 "5b8cbe703aba6ea3520a9e8a6280aa7c166fd0cde1ab42bb0e321683b6e12e8f"

  url "https://github.com/femifleming/poppsphere-bundle/releases/download/v#{version}/poppsphere-bundle-macOS.zip"
  name "opensphere"
  desc "Openprocess as an Ambisonics encoder (1st-7th order, AmbiX)"
  homepage "https://github.com/femifleming/poppsphere-bundle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "poppsphere-bundle-macOS/opensphere/opensphere.app"
  audio_unit_plugin "poppsphere-bundle-macOS/opensphere/opensphere.component"
  vst_plugin "poppsphere-bundle-macOS/opensphere/opensphere.vst"
  vst3_plugin "poppsphere-bundle-macOS/opensphere/opensphere.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "poppsphere-bundle-macOS/opensphere"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/opensphere.settings"
end
