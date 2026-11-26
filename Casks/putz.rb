cask "putz" do
  version "1.0.0,1.2.0"
  sha256 "ef03253b4766373c39fa325dace79a9e7d51030557e4c3ecc50b5cd0cfdfb3c6"

  url "https://github.com/femifleming/faltung/releases/download/v#{version.csv.second}/putz-macOS.zip"
  name "putz"
  desc "System cleaner: caches, leftovers, crash dumps, duplicates, startup items (part of the faltung suite)"
  homepage "https://github.com/femifleming/faltung"

  # putz ships with faltung's releases (two versions: putz's own, and the faltung release it is in)
  livecheck do
    skip "Released with faltung"
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "putz.app"

  # ad-hoc signed, not notarised: clear the download quarantine (before it's moved into place) so it opens
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "putz.app"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Preferences/com.x.putz.plist"
end
