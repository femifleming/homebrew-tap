cask "spreekbuis" do
  version "2.0.0"
  sha256 "26bc9677113a96091f33422fea5dd846a73310e2a4fb5ca18a6835ef386ab6d6"

  url "https://github.com/femifleming/spreek/releases/download/v#{version}/spreek-macOS.zip"
  name "spreekbuis"
  desc "Dutch as an instrument with a speech computer inside (absorbs spraakmaker)"
  homepage "https://github.com/femifleming/spreek"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "spreek-macOS/Spreekbuis/Spreekbuis.app"
  audio_unit_plugin "spreek-macOS/Spreekbuis/Spreekbuis.component"
  vst_plugin "spreek-macOS/Spreekbuis/Spreekbuis.vst"
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
    Spreekbuis 2.0 is one plug-in: the word bank's layers and the speech computer that used to be
    Spraakmaker. Old Spreekbuis sessions open unchanged; Spraakmaker presets and states import from the
    preset menu (open of importeer). The recorded voice: until you render one, a built-in formant voice
    speaks; unzip spreek-macOS.zip (or clone https://github.com/femifleming/spreek) and run
    Spreekbuis/tools/render.sh (see the manual for Voxtral / Piper). Manual: Spreekbuis Manual.pdf in the zip.
  EOS
end
