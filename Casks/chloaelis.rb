cask "chloaelis" do
  version "1.1.1"
  sha256 "689381b4d475a11376adc101936a1fe5ec4e6aa47febd7109279276d5341e083"

  url "https://github.com/femifleming/chloaelis/releases/download/v#{version}/Chloaelis-macOS.zip"
  name "chloaelis"
  desc "Dual-channel filter, tube and delay instrument with a Lorenz attractor"
  homepage "https://github.com/femifleming/chloaelis"

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
