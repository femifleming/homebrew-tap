cask "nabra" do
  version "1.1.0"
  sha256 "43638991c092adf7907d7f60fee36efe51fb49c79e3dd668266e7533fcacde61"

  url "https://github.com/femifleming/nabra/releases/download/v#{version}/Nabra-#{version}-macOS.zip"
  name "Nabra"
  desc "Knobless tapestry modular synth after Peter Blasser's Nabra (app, VST3, AU)"
  homepage "https://github.com/femifleming/nabra"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Nabra.app"
  audio_unit_plugin "Nabra.component"
  vst3_plugin "Nabra.vst3"

  # Builds are ad-hoc signed but not notarized: clear the quarantine flag
  # (before the app and plug-ins are moved into place) so Gatekeeper lets them open.
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Nabra.app", "Nabra.vst3", "Nabra.component"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Nabra",
    "~/Library/Application Support/Nabra.settings",
  ]
end
