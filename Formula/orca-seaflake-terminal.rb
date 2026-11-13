class OrcaSeaflakeTerminal < Formula
  desc "Orca Seaflake live-coding grid sequencer for the terminal, with Song Mode"
  homepage "https://github.com/femifleming/orca_seaflake/tree/main/terminal"
  url "https://github.com/femifleming/orca_seaflake/releases/download/v0.10.2/orca-seaflake-terminal-0.10.2.tgz"
  sha256 "3257e6f1ebd322923b5c3649cf63afa3b68c1583a0e9d6b30ffb5657f4d8d00a"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/orca-seaflake --version").strip
  end
end
