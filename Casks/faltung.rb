cask "faltung" do
  version "1.0.0"
  sha256 "2dd526939abd744cdcfa8c759c5b2d266d2f4ec2e7abea743ebf4f522e3a0963"

  url "https://github.com/femifleming/faltung/releases/download/v#{version}/faltung-macOS.zip"
  name "faltung"
  desc "Drums, processes, dubstep bass and a mastering bus for minimal and microhouse"
  homepage "https://github.com/femifleming/faltung"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "faltung-macOS/faltung kt1/faltung kt1.app", target: "faltung/faltung kt1.app"
  app "faltung-macOS/faltung kt2/faltung kt2.app", target: "faltung/faltung kt2.app"
  app "faltung-macOS/faltung bd1/faltung bd1.app", target: "faltung/faltung bd1.app"
  app "faltung-macOS/faltung sd2/faltung sd2.app", target: "faltung/faltung sd2.app"
  app "faltung-macOS/faltung rm3/faltung rm3.app", target: "faltung/faltung rm3.app"
  app "faltung-macOS/faltung hh4/faltung hh4.app", target: "faltung/faltung hh4.app"
  app "faltung-macOS/faltung cp6/faltung cp6.app", target: "faltung/faltung cp6.app"
  app "faltung-macOS/faltung pc7/faltung pc7.app", target: "faltung/faltung pc7.app"
  app "faltung-macOS/faltung cl8/faltung cl8.app", target: "faltung/faltung cl8.app"
  app "faltung-macOS/faltung tm9/faltung tm9.app", target: "faltung/faltung tm9.app"
  app "faltung-macOS/faltung mc3/faltung mc3.app", target: "faltung/faltung mc3.app"
  app "faltung-macOS/faltung dl4/faltung dl4.app", target: "faltung/faltung dl4.app"
  app "faltung-macOS/faltung rv5/faltung rv5.app", target: "faltung/faltung rv5.app"
  app "faltung-macOS/faltung sw6/faltung sw6.app", target: "faltung/faltung sw6.app"
  app "faltung-macOS/faltung fl7/faltung fl7.app", target: "faltung/faltung fl7.app"
  app "faltung-macOS/faltung gl8/faltung gl8.app", target: "faltung/faltung gl8.app"
  app "faltung-macOS/faltung wb1/faltung wb1.app", target: "faltung/faltung wb1.app"
  app "faltung-macOS/faltung ms0/faltung ms0.app", target: "faltung/faltung ms0.app"
  audio_unit_plugin "faltung-macOS/faltung kt1/faltung kt1.component"
  audio_unit_plugin "faltung-macOS/faltung kt2/faltung kt2.component"
  audio_unit_plugin "faltung-macOS/faltung bd1/faltung bd1.component"
  audio_unit_plugin "faltung-macOS/faltung sd2/faltung sd2.component"
  audio_unit_plugin "faltung-macOS/faltung rm3/faltung rm3.component"
  audio_unit_plugin "faltung-macOS/faltung hh4/faltung hh4.component"
  audio_unit_plugin "faltung-macOS/faltung cp6/faltung cp6.component"
  audio_unit_plugin "faltung-macOS/faltung pc7/faltung pc7.component"
  audio_unit_plugin "faltung-macOS/faltung cl8/faltung cl8.component"
  audio_unit_plugin "faltung-macOS/faltung tm9/faltung tm9.component"
  audio_unit_plugin "faltung-macOS/faltung mc3/faltung mc3.component"
  audio_unit_plugin "faltung-macOS/faltung dl4/faltung dl4.component"
  audio_unit_plugin "faltung-macOS/faltung rv5/faltung rv5.component"
  audio_unit_plugin "faltung-macOS/faltung sw6/faltung sw6.component"
  audio_unit_plugin "faltung-macOS/faltung fl7/faltung fl7.component"
  audio_unit_plugin "faltung-macOS/faltung gl8/faltung gl8.component"
  audio_unit_plugin "faltung-macOS/faltung wb1/faltung wb1.component"
  audio_unit_plugin "faltung-macOS/faltung ms0/faltung ms0.component"
  vst_plugin "faltung-macOS/faltung kt1/faltung kt1.vst"
  vst_plugin "faltung-macOS/faltung kt2/faltung kt2.vst"
  vst_plugin "faltung-macOS/faltung bd1/faltung bd1.vst"
  vst_plugin "faltung-macOS/faltung sd2/faltung sd2.vst"
  vst_plugin "faltung-macOS/faltung rm3/faltung rm3.vst"
  vst_plugin "faltung-macOS/faltung hh4/faltung hh4.vst"
  vst_plugin "faltung-macOS/faltung cp6/faltung cp6.vst"
  vst_plugin "faltung-macOS/faltung pc7/faltung pc7.vst"
  vst_plugin "faltung-macOS/faltung cl8/faltung cl8.vst"
  vst_plugin "faltung-macOS/faltung tm9/faltung tm9.vst"
  vst_plugin "faltung-macOS/faltung mc3/faltung mc3.vst"
  vst_plugin "faltung-macOS/faltung dl4/faltung dl4.vst"
  vst_plugin "faltung-macOS/faltung rv5/faltung rv5.vst"
  vst_plugin "faltung-macOS/faltung sw6/faltung sw6.vst"
  vst_plugin "faltung-macOS/faltung fl7/faltung fl7.vst"
  vst_plugin "faltung-macOS/faltung gl8/faltung gl8.vst"
  vst_plugin "faltung-macOS/faltung wb1/faltung wb1.vst"
  vst_plugin "faltung-macOS/faltung ms0/faltung ms0.vst"
  vst3_plugin "faltung-macOS/faltung kt1/faltung kt1.vst3"
  vst3_plugin "faltung-macOS/faltung kt2/faltung kt2.vst3"
  vst3_plugin "faltung-macOS/faltung bd1/faltung bd1.vst3"
  vst3_plugin "faltung-macOS/faltung sd2/faltung sd2.vst3"
  vst3_plugin "faltung-macOS/faltung rm3/faltung rm3.vst3"
  vst3_plugin "faltung-macOS/faltung hh4/faltung hh4.vst3"
  vst3_plugin "faltung-macOS/faltung cp6/faltung cp6.vst3"
  vst3_plugin "faltung-macOS/faltung pc7/faltung pc7.vst3"
  vst3_plugin "faltung-macOS/faltung cl8/faltung cl8.vst3"
  vst3_plugin "faltung-macOS/faltung tm9/faltung tm9.vst3"
  vst3_plugin "faltung-macOS/faltung mc3/faltung mc3.vst3"
  vst3_plugin "faltung-macOS/faltung dl4/faltung dl4.vst3"
  vst3_plugin "faltung-macOS/faltung rv5/faltung rv5.vst3"
  vst3_plugin "faltung-macOS/faltung sw6/faltung sw6.vst3"
  vst3_plugin "faltung-macOS/faltung fl7/faltung fl7.vst3"
  vst3_plugin "faltung-macOS/faltung gl8/faltung gl8.vst3"
  vst3_plugin "faltung-macOS/faltung wb1/faltung wb1.vst3"
  vst3_plugin "faltung-macOS/faltung ms0/faltung ms0.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "faltung-macOS"],
        chdir:        ".",
        must_succeed: false
  end

  caveats <<~EOS
    The apps are in /Applications/faltung. Manuals: faltung Manual.pdf, ms0 master Manual.pdf and Partials Manual.pdf,
    https://github.com/femifleming/faltung (Partials is its own cask: femifleming/tap/partials).
  EOS
end
