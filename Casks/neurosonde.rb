cask "neurosonde" do
  version "1.1.0"
  sha256 "6f39666f2a547f4c41d2cfa87db08e6f7b331910c22941f8e014c31f5e367cd4"

  url "https://github.com/femifleming/neurosonde/releases/download/v#{version}/Neurosonde-macOS.zip"
  name "Neurosonde"
  name "Neurosonde Space"
  desc "Audio effect that trains a neural network on what it hears and resynthesises it"
  homepage "https://github.com/femifleming/neurosonde"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Neurosonde-macOS/Neurosonde/Neurosonde.app"
  app "Neurosonde-macOS/Neurosonde Space/Neurosonde Space.app"
  audio_unit_plugin "Neurosonde-macOS/Neurosonde/Neurosonde.component"
  audio_unit_plugin "Neurosonde-macOS/Neurosonde Space/Neurosonde Space.component"
  vst3_plugin "Neurosonde-macOS/Neurosonde/Neurosonde.vst3"
  vst3_plugin "Neurosonde-macOS/Neurosonde Space/Neurosonde Space.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Neurosonde-macOS"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/Neurosonde"
end
