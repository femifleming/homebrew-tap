class PilotSealflake < Formula
  desc "Synth for Orca with Teletype and Just Friends built in (app, VST3, LV2)"
  homepage "https://github.com/femifleming/orca_seaflake/tree/main/pilot"
  version "1.1.1"
  license "GPL-2.0-only"

  # macOS users: brew install --cask femifleming/tap/pilot-sealflake
  depends_on :linux

  on_linux do
    on_intel do
      url "https://github.com/femifleming/orca_seaflake/releases/download/v0.10.2/Pilot-Sealflake-1.1.1-linux-x64.tar.gz"
      sha256 "9a93252bc2b14c51c195adefe5a7b30da0d5f882e69110910a5a4352545b531a"
    end
    on_arm do
      url "https://github.com/femifleming/orca_seaflake/releases/download/v0.10.2/Pilot-Sealflake-1.1.1-linux-arm64.tar.gz"
      sha256 "cf3a017df081628fd5922026f56b34835a3a676476ec5524816d056fb5358f6c"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"pilot-sealflake"
  end

  def caveats
    <<~EOS
      The plug-ins are in #{opt_libexec}. To make your DAW see them:
        mkdir -p ~/.vst3 ~/.lv2
        ln -sf "#{opt_libexec}/Pilot Sealflake.vst3" ~/.vst3/
        ln -sf "#{opt_libexec}/Pilot Sealflake.lv2" ~/.lv2/
      Pilot needs the usual desktop libraries (ALSA, FreeType, fontconfig, X11).
    EOS
  end

  test do
    assert_predicate libexec/"pilot-sealflake", :executable?
    assert_predicate libexec/"Pilot Sealflake.vst3", :directory?
    assert_predicate libexec/"Pilot Sealflake.lv2", :directory?
  end
end
