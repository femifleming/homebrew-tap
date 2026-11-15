cask "convosolution" do
  version "1.0.1"
  sha256 "cfd7a274041ce7c45550725986b84e50733a3d351371bdbc17ca3bf8e3fc91a9"

  url "https://github.com/femifleming/convosolution/releases/download/v#{version}/ConvoSolution-#{version}-macOS.zip"
  name "convosolution"
  desc "Convolution reverb plug-in (ECR+ based, 90s web page UI, LFO matrix)"
  homepage "https://github.com/femifleming/convosolution"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ConvoSolution-#{version}-macOS/Applications/ConvoSolution.app"
  audio_unit_plugin "ConvoSolution-#{version}-macOS/Components/ConvoSolution.component"
  vst3_plugin "ConvoSolution-#{version}-macOS/VST3/ConvoSolution.vst3"
  vst_plugin "ConvoSolution-#{version}-macOS/VST/ConvoSolution.vst"

  # ad-hoc signed, not notarised: clear the download quarantine (before it's moved into place) so it opens
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "ConvoSolution-#{version}-macOS"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/ConvoSolution",
    "~/Library/Application Support/ConvoSolution.settings",
  ]
end
