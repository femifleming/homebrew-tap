cask "chloaeilius" do
  version "0.3.1"
  sha256 "4f44d3088c3b02e163a49f103bd325088e9b427aa6738b0e9f79e08ccd8f6fde"

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
