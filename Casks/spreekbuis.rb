cask "spreekbuis" do
  version "1.0.0"
  sha256 "e5aa456b44c169de14371d542ecb437c6f89568346a11469c58f59609604529a"

  url "https://github.com/femifleming/spreek/releases/download/v#{version}/spreek-macOS.zip"
  name "spreekbuis"
  desc "Dutch as an instrument: lesson loop, word cloud, vowel chart and the Dutch g"
  homepage "https://github.com/femifleming/spreek"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "spreek-macOS/Spreekbuis/Spreekbuis.app"
  audio_unit_plugin "spreek-macOS/Spreekbuis/Spreekbuis.component"
  vst3_plugin "spreek-macOS/Spreekbuis/Spreekbuis.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "spreek-macOS/Spreekbuis"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/Spreekbuis"

  caveats <<~EOS
    Spreekbuis speaks with a built-in formant voice until you render a natural one: unzip spreek-macOS.zip
    (or clone https://github.com/femifleming/spreek) and run Spreekbuis/tools/render.sh, which records every
    item with the best installed Dutch voice (System Settings > Accessibility > Spoken Content > Manage Voices
    > Dutch: Xander Enhanced / Claire Premium). Manual: Spreekbuis Manual.pdf in the zip.
  EOS
end
