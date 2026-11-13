cask "pinkiepiesballoonshop" do
  version "1.2.2"
  sha256 "d06229050e3b679a2dccf13feed9fa8673b01800ef9401242d50df5b3e01d750"

  url "https://github.com/femifleming/pinkiepiesballoonshop/releases/download/v#{version}/PinkiePiesBalloonShop-macOS.zip"
  name "pinkie pie's balloon shop"
  desc "Multi-effect you play as balloons"
  homepage "https://github.com/femifleming/pinkiepiesballoonshop"

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
