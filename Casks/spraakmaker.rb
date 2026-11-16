cask "spraakmaker" do
  version "1.0.0"
  sha256 "e5aa456b44c169de14371d542ecb437c6f89568346a11469c58f59609604529a"

  url "https://github.com/femifleming/spreek/releases/download/v#{version}/spreek-macOS.zip"
  name "spraakmaker"
  desc "Speech computer instrument: formant synthesis that speaks English and Dutch"
  homepage "https://github.com/femifleming/spreek"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "spreek-macOS/Spraakmaker/Spraakmaker.app"
  audio_unit_plugin "spreek-macOS/Spraakmaker/Spraakmaker.component"
  vst3_plugin "spreek-macOS/Spraakmaker/Spraakmaker.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "spreek-macOS/Spraakmaker"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/Spraakmaker"

  caveats <<~EOS
    An homage after the Phonemer by moddict (not affiliated). Manual: Spraakmaker Manual.pdf in the zip.
  EOS
end
