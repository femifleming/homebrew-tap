cask "faltung" do
  version "1.2.0"
  sha256 "8f2fa180c4b4e004af6e53e649f177eae70b1555a0ed725e19486669d7f6c076"

  url "https://github.com/femifleming/faltung/releases/download/v#{version}/faltung-macOS.zip"
  name "faltung"
  desc "Microhouse drums, effects, bass, mastering, reverb, synths and a DAW"
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
  app "faltung-macOS/ConvoSolution/ConvoSolution.app", target: "faltung/ConvoSolution.app"
  app "faltung-macOS/ObliqSound/ObliqSound.app", target: "faltung/ObliqSound.app"
  app "faltung-macOS/ObliqSonic/ObliqSonic.app", target: "faltung/ObliqSonic.app"
  app "faltung-macOS/ballonwinkel/ballonwinkel.app", target: "faltung/ballonwinkel.app"
  app "faltung-macOS/ballonpaleis/ballonpaleis.app", target: "faltung/ballonpaleis.app"
  app "faltung-macOS/faltung sndstudio/faltung sndstudio.app", target: "faltung/faltung sndstudio.app"
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
  audio_unit_plugin "faltung-macOS/ConvoSolution/ConvoSolution.component"
  audio_unit_plugin "faltung-macOS/ObliqSound/ObliqSound.component"
  audio_unit_plugin "faltung-macOS/ObliqSonic/ObliqSonic.component"
  audio_unit_plugin "faltung-macOS/ballonwinkel/ballonwinkel.component"
  audio_unit_plugin "faltung-macOS/ballonpaleis/ballonpaleis.component"
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
  vst_plugin "faltung-macOS/ConvoSolution/ConvoSolution.vst"
  vst_plugin "faltung-macOS/ObliqSound/ObliqSound.vst"
  vst_plugin "faltung-macOS/ObliqSonic/ObliqSonic.vst"
  vst_plugin "faltung-macOS/ballonwinkel/ballonwinkel.vst"
  vst_plugin "faltung-macOS/ballonpaleis/ballonpaleis.vst"
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
  vst3_plugin "faltung-macOS/ConvoSolution/ConvoSolution.vst3"
  vst3_plugin "faltung-macOS/ObliqSound/ObliqSound.vst3"
  vst3_plugin "faltung-macOS/ObliqSonic/ObliqSonic.vst3"
  vst3_plugin "faltung-macOS/ballonwinkel/ballonwinkel.vst3"
  vst3_plugin "faltung-macOS/ballonpaleis/ballonpaleis.vst3"

  # the builds are ad-hoc signed, not notarised: clear the download quarantine (before they're moved
  # into place) so they open
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "faltung-macOS"],
        chdir:        ".",
        must_succeed: false
  end

  caveats <<~EOS
    The apps are in /Applications/faltung (sndstudio, the standalone DAW, is an app only).
    Manuals: faltung, ms0 master, sndstudio, convosolution, obliqsound, Partials and Cloudfin Manual.pdf,
    https://github.com/femifleming/faltung (Partials and Cloudfin are their own casks:
    femifleming/tap/partials, femifleming/tap/cloudfin).
  EOS
end
