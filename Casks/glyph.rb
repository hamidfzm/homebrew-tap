cask "glyph" do
  version "0.4.0"
  sha256 "f14b468253f756dcad08117daec0a5ee02c28055d139d2daf5d9eddf93497bac"

  url "https://github.com/hamidfzm/glyph/releases/download/v#{version}/Glyph_#{version}_universal.dmg"
  name "Glyph"
  desc "Cross-platform markdown viewer"
  homepage "https://github.com/hamidfzm/glyph"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Glyph.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Glyph.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.hamidfzm.glyph",
    "~/Library/Caches/com.hamidfzm.glyph",
    "~/Library/Preferences/com.hamidfzm.glyph.plist",
  ]
end
