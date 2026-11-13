class Nabra < Formula
  desc "Knobless tapestry modular synth after Peter Blasser's Nabra (app, VST3, LV2)"
  homepage "https://github.com/femifleming/nabra"
  url "https://github.com/femifleming/nabra/releases/download/v1.1.0/Nabra-1.1.0-Linux-x86_64.tar.gz"
  sha256 "c281f816c9583e89deca77f9445daca25f559cf76d89df87d74ad85b41c56dc4"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # macOS users: brew install --cask femifleming/tap/nabra
  depends_on arch: :x86_64
  depends_on :linux

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/Nabra"
    bin.install_symlink libexec/"bin/Nabra" => "nabra"
    bin.install_symlink libexec/"bin/nabra-link-plugins"
  end

  def caveats
    <<~EOS
      To make the VST3/LV2 plug-ins visible to your DAW and add Nabra to your
      applications menu, run once:
        nabra-link-plugins
      (undo with: nabra-link-plugins --remove)

      Nabra needs the usual desktop libraries (ALSA, FreeType, fontconfig, X11),
      which nearly every Linux desktop already has.
    EOS
  end

  test do
    assert_predicate libexec/"bin/Nabra", :executable?
    assert_path_exists libexec/"lib/vst3/Nabra.vst3/Contents/x86_64-linux/Nabra.so"
    assert_predicate libexec/"lib/lv2/Nabra.lv2", :directory?
  end
end
