cask "chloaeilius" do
  version "0.3.0"
  sha256 "21f5a0d6df92576fed27e35497956394f1455dbb768c270c9f1d0603d991d67f"

  url "https://github.com/femifleming/chloaelis/releases/download/chloaeilius-v#{version}/Chloaeilius-macOS.zip"
  name "chloaeilius"
  desc "Chloaelis as spatial audio: an Ambisonics encoder"
  homepage "https://github.com/femifleming/chloaelis/tree/main/Chloaeilius"

  livecheck do
    url :url
    regex(/^chloaeilius[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on :macos

  app "Chloaeilius/Chloaeilius.app"
  audio_unit_plugin "Chloaeilius/Chloaeilius.component"
  vst3_plugin "Chloaeilius/Chloaeilius.vst3"

  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Chloaeilius/Chloaeilius.app",
                       "Chloaeilius/Chloaeilius.component", "Chloaeilius/Chloaeilius.vst3"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/Chloaeilius"
end
