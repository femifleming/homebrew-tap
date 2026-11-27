cask "uniqlo-screensaver" do
  version "1.0.1"
  sha256 "22135a299919bfcd942521874d85a85463402d94fa86359c3386370f1f9ffcbe"

  url "https://github.com/femifleming/uniqlo-screensaver/releases/download/v#{version}/UNIQLO-SCREENSAVER-mac.zip"
  name "UNIQLO SCREENSAVER"
  desc "Unofficial fan rebuild of the UNIQLO SCREENSAVER and UNIQLOCK as a screen saver"
  homepage "https://github.com/femifleming/uniqlo-screensaver"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  screen_saver "UNIQLO SCREENSAVER/UNIQLO SCREENSAVER.saver"

  # ad-hoc signed, not notarised: clear the download quarantine (before it's moved into place) so it loads
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "UNIQLO SCREENSAVER"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/UNIQLO SCREENSAVER"

  caveats <<~EOS
    Choose it in System Settings > Screen Saver ("UNIQLO SCREENSAVER", under Other).
    Unofficial, non-commercial fan project; not affiliated with UNIQLO or Fast Retailing.
  EOS
end
