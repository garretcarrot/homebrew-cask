cask "genymotion" do
  on_monterey :or_older do
    version "3.5.0"
    sha256 "c4be3f53a85908027340b7529dcdc79e7a6b19572056b354fc94d9688c0c10f7"

    livecheck do
      skip "Legacy version"
    end
  end
  on_ventura :or_newer do
    version "3.7.0"
    sha256 "b8de2b1975b9d7be6ef81a6899ff4b3066b35765cd56f01c07d87b0e6fc97f5c"

    livecheck do
      url "https://www.genymotion.com/product-desktop/download/"
      regex(/href=.*?Genymotion[._-]v?(\d+(?:\.\d+)+)\.(?:dmg|pkg)/i)
    end
  end

  url "https://dl.genymotion.com/releases/genymotion-#{version}/genymotion-#{version}.dmg"
  name "Genymotion"
  desc "Android emulator"
  homepage "https://www.genymotion.com/"

  app "Genymotion.app"
  app "Genymotion Shell.app"
  binary "#{appdir}/Genymotion Shell.app/Contents/MacOS/genyshell"

  zap trash: [
    "~/.Genymobile",
    "~/Library/Caches/Genymobile",
    "~/Library/Preferences/com.genymobile.Genymotion.plist",
    "~/Library/Preferences/com.genymobile.soft.Genymotion.plist",
    "~/Library/Saved Application State/com.genymobile.genymotion.savedState",
    "~/Library/Saved Application State/com.genymobile.player.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
