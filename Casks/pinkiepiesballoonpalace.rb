cask "pinkiepiesballoonpalace" do
  version "0.3.1"
  sha256 "2aaa27c0be424c49dbb47c9d23bdae7010444b3b2fea037e43b2d0a5b12102ea"

  url "https://github.com/femifleming/PinkiePiesBalloonShop/releases/download/balloonpalace-v#{version}/PinkiePiesBalloonPalace-macOS.zip"
  name "Pinkie Pie's Balloon Palace"
  desc "Spatial audio Balloon Shop: an Ambisonics encoder, 1st to 7th order"
  homepage "https://github.com/femifleming/PinkiePiesBalloonShop/tree/main/BalloonPalace"

  livecheck do
    url :url
    regex(/^balloonpalace[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on :macos

  app "Pinkie Pies Balloon Palace/Pinkie Pies Balloon Palace.app"
  audio_unit_plugin "Pinkie Pies Balloon Palace/Pinkie Pies Balloon Palace.component"
  vst3_plugin "Pinkie Pies Balloon Palace/Pinkie Pies Balloon Palace.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Pinkie Pies Balloon Palace/Pinkie Pies Balloon Palace.app",
                       "Pinkie Pies Balloon Palace/Pinkie Pies Balloon Palace.component",
                       "Pinkie Pies Balloon Palace/Pinkie Pies Balloon Palace.vst3"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/FreakiePie/Balloon Palace last patch.xml",
    "~/Library/Application Support/FreakiePie/Mellyloon last patch.xml",
    "~/Library/Application Support/Mellyloon.settings",
    "~/Library/Application Support/Pinkie Pies Balloon Palace.settings",
  ]
end
