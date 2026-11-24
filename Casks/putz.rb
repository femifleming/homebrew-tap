cask "putz" do
  version "1.0.0"
  sha256 "f2a946d9d13f35ff8e6f7f95ef620b437e696211172130daad5a4649372e89ba"

  url "https://github.com/femifleming/putz/releases/download/v#{version}/putz-macOS.zip"
  name "putz"
  desc "Mac cleaner: caches, leftovers, crash dumps, duplicates, startup items"
  homepage "https://github.com/femifleming/putz"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "putz.app"

  # ad-hoc signed, not notarised: clear the download quarantine (before it's moved into place) so it opens
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "putz.app"],
        chdir:        ".",
        must_succeed: false
  end

  zap trash: "~/Library/Preferences/com.freakiepie.putz.plist"
end
