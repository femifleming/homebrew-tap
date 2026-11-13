cask "pinkiepiesballoonpalace" do
  version "0.3.2"
  sha256 "ba746038e0e0ecf24d5a1041482496c245d9fb1b3433859aa718dae461e0c5f4"

  url "https://github.com/femifleming/pinkiepiesballoonshop/releases/download/balloonpalace-v#{version}/PinkiePiesBalloonPalace-macOS.zip"
  name "pinkie pie's balloon palace"
  desc "Spatial audio Balloon Shop: an Ambisonics encoder, 1st to 7th order"
  homepage "https://github.com/femifleming/pinkiepiesballoonshop/tree/main/BalloonPalace"

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
