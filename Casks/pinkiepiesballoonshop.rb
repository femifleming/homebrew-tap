cask "pinkiepiesballoonshop" do
  version "1.2.1"
  sha256 "2fad027617f1f27902e9227069fb466502bcf266d431ebd7dbf4a1fd4b02b66a"

  url "https://github.com/femifleming/PinkiePiesBalloonShop/releases/download/v#{version}/PinkiePiesBalloonShop-macOS.zip"
  name "Pinkie Pie's Balloon Shop"
  desc "Multi-effect you play as balloons"
  homepage "https://github.com/femifleming/PinkiePiesBalloonShop"

  depends_on :macos

  app "Pinkie Pies Balloon Shop/Pinkie Pies Balloon Shop.app"
  audio_unit_plugin "Pinkie Pies Balloon Shop/Pinkie Pies Balloon Shop.component"
  vst3_plugin "Pinkie Pies Balloon Shop/Pinkie Pies Balloon Shop.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "Pinkie Pies Balloon Shop/Pinkie Pies Balloon Shop.app",
                       "Pinkie Pies Balloon Shop/Pinkie Pies Balloon Shop.component",
                       "Pinkie Pies Balloon Shop/Pinkie Pies Balloon Shop.vst3"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/FreakiePie/Balloon Shoppe last patch.xml",
    "~/Library/Application Support/Pinkie Pie's Balloon Shop.settings",
    "~/Library/Application Support/Pinkie Pies Balloon Shop.settings",
  ]
end
