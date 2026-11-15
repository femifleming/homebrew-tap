cask "faltung-deep" do
  version "1.0.0"
  sha256 "4d31c67feb17bebd0cc0662c7aafa5d3d652070decb4b0003002e47444679831"

  url "https://github.com/femifleming/faltung/releases/download/v#{version}/faltung-deep-macOS.zip"
  name "faltung deep"
  desc "Deep house drums, processes and chord stabs"
  homepage "https://github.com/femifleming/faltung"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "faltung-deep-macOS/faltung deep kt1/faltung deep kt1.app", target: "faltung deep/faltung deep kt1.app"
  app "faltung-deep-macOS/faltung deep kt2/faltung deep kt2.app", target: "faltung deep/faltung deep kt2.app"
  app "faltung-deep-macOS/faltung deep bd1/faltung deep bd1.app", target: "faltung deep/faltung deep bd1.app"
  app "faltung-deep-macOS/faltung deep sd2/faltung deep sd2.app", target: "faltung deep/faltung deep sd2.app"
  app "faltung-deep-macOS/faltung deep rm3/faltung deep rm3.app", target: "faltung deep/faltung deep rm3.app"
  app "faltung-deep-macOS/faltung deep hh4/faltung deep hh4.app", target: "faltung deep/faltung deep hh4.app"
  app "faltung-deep-macOS/faltung deep cp6/faltung deep cp6.app", target: "faltung deep/faltung deep cp6.app"
  app "faltung-deep-macOS/faltung deep pc7/faltung deep pc7.app", target: "faltung deep/faltung deep pc7.app"
  app "faltung-deep-macOS/faltung deep cl8/faltung deep cl8.app", target: "faltung deep/faltung deep cl8.app"
  app "faltung-deep-macOS/faltung deep tm9/faltung deep tm9.app", target: "faltung deep/faltung deep tm9.app"
  app "faltung-deep-macOS/faltung deep mc3/faltung deep mc3.app", target: "faltung deep/faltung deep mc3.app"
  app "faltung-deep-macOS/faltung deep dl4/faltung deep dl4.app", target: "faltung deep/faltung deep dl4.app"
  app "faltung-deep-macOS/faltung deep rv5/faltung deep rv5.app", target: "faltung deep/faltung deep rv5.app"
  app "faltung-deep-macOS/faltung deep sw6/faltung deep sw6.app", target: "faltung deep/faltung deep sw6.app"
  app "faltung-deep-macOS/faltung deep fl7/faltung deep fl7.app", target: "faltung deep/faltung deep fl7.app"
  app "faltung-deep-macOS/faltung deep gl8/faltung deep gl8.app", target: "faltung deep/faltung deep gl8.app"
  app "faltung-deep-macOS/faltung deep sb1/faltung deep sb1.app", target: "faltung deep/faltung deep sb1.app"
  audio_unit_plugin "faltung-deep-macOS/faltung deep kt1/faltung deep kt1.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep kt2/faltung deep kt2.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep bd1/faltung deep bd1.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep sd2/faltung deep sd2.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep rm3/faltung deep rm3.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep hh4/faltung deep hh4.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep cp6/faltung deep cp6.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep pc7/faltung deep pc7.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep cl8/faltung deep cl8.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep tm9/faltung deep tm9.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep mc3/faltung deep mc3.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep dl4/faltung deep dl4.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep rv5/faltung deep rv5.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep sw6/faltung deep sw6.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep fl7/faltung deep fl7.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep gl8/faltung deep gl8.component"
  audio_unit_plugin "faltung-deep-macOS/faltung deep sb1/faltung deep sb1.component"
  vst_plugin "faltung-deep-macOS/faltung deep kt1/faltung deep kt1.vst"
  vst_plugin "faltung-deep-macOS/faltung deep kt2/faltung deep kt2.vst"
  vst_plugin "faltung-deep-macOS/faltung deep bd1/faltung deep bd1.vst"
  vst_plugin "faltung-deep-macOS/faltung deep sd2/faltung deep sd2.vst"
  vst_plugin "faltung-deep-macOS/faltung deep rm3/faltung deep rm3.vst"
  vst_plugin "faltung-deep-macOS/faltung deep hh4/faltung deep hh4.vst"
  vst_plugin "faltung-deep-macOS/faltung deep cp6/faltung deep cp6.vst"
  vst_plugin "faltung-deep-macOS/faltung deep pc7/faltung deep pc7.vst"
  vst_plugin "faltung-deep-macOS/faltung deep cl8/faltung deep cl8.vst"
  vst_plugin "faltung-deep-macOS/faltung deep tm9/faltung deep tm9.vst"
  vst_plugin "faltung-deep-macOS/faltung deep mc3/faltung deep mc3.vst"
  vst_plugin "faltung-deep-macOS/faltung deep dl4/faltung deep dl4.vst"
  vst_plugin "faltung-deep-macOS/faltung deep rv5/faltung deep rv5.vst"
  vst_plugin "faltung-deep-macOS/faltung deep sw6/faltung deep sw6.vst"
  vst_plugin "faltung-deep-macOS/faltung deep fl7/faltung deep fl7.vst"
  vst_plugin "faltung-deep-macOS/faltung deep gl8/faltung deep gl8.vst"
  vst_plugin "faltung-deep-macOS/faltung deep sb1/faltung deep sb1.vst"
  vst3_plugin "faltung-deep-macOS/faltung deep kt1/faltung deep kt1.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep kt2/faltung deep kt2.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep bd1/faltung deep bd1.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep sd2/faltung deep sd2.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep rm3/faltung deep rm3.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep hh4/faltung deep hh4.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep cp6/faltung deep cp6.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep pc7/faltung deep pc7.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep cl8/faltung deep cl8.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep tm9/faltung deep tm9.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep mc3/faltung deep mc3.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep dl4/faltung deep dl4.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep rv5/faltung deep rv5.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep sw6/faltung deep sw6.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep fl7/faltung deep fl7.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep gl8/faltung deep gl8.vst3"
  vst3_plugin "faltung-deep-macOS/faltung deep sb1/faltung deep sb1.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "faltung-deep-macOS"],
        chdir:        ".",
        must_succeed: false
  end

  caveats <<~EOS
    The apps are in /Applications/faltung deep. Manual: faltung deep Manual.pdf,
    https://github.com/femifleming/faltung
  EOS
end
