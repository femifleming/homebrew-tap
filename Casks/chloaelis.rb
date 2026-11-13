cask "chloaelis" do
  version "1.1.0"
  sha256 "e67d812650c219d68644a8d4494a719fbcd22fe86a221c626ed9c702f189c70e"

  url "https://github.com/femifleming/Chloaelis/releases/download/v#{version}/Chloaelis-macOS.zip"
  name "Chloaelis"
  desc "Dual-channel filter, tube and delay instrument with a Lorenz attractor"
  homepage "https://github.com/femifleming/Chloaelis"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on :macos

  app "Chloaelis/Chloaelis.app"
  audio_unit_plugin "Chloaelis/Chloaelis.component"
  vst3_plugin "Chloaelis/Chloaelis.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Chloaelis/Chloaelis.app",
                       "Chloaelis/Chloaelis.component", "Chloaelis/Chloaelis.vst3"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/Chloaelis"
end
