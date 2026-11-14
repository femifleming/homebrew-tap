cask "openprocess" do
  version "1.3.0"
  sha256 "02ba7e783937eb881587d530a5252a3225b3eea1692cb7b08da00d2f2b3e5869"

  url "https://github.com/femifleming/poppsphere-bundle/releases/download/v#{version}/poppsphere-bundle-macOS.zip"
  name "openprocess"
  desc "Loop workspace after Oval's ovalprocess, with a 30-minute timeline"
  homepage "https://github.com/femifleming/poppsphere-bundle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "poppsphere-bundle-macOS/openprocess/openprocess.app"
  audio_unit_plugin "poppsphere-bundle-macOS/openprocess/openprocess.component"
  vst_plugin "poppsphere-bundle-macOS/openprocess/openprocess.vst"
  vst3_plugin "poppsphere-bundle-macOS/openprocess/openprocess.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "poppsphere-bundle-macOS/openprocess"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/openprocess.settings"
end
