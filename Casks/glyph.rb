cask "glyph" do
  version "0.1.3"
  sha256 "989dd721b6b015a0a0abe45b1436b1f78eb8096a3c6247674bcc9ac4032030d4"

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
