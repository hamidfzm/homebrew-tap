cask "glyph" do
  version "0.10.0"
  sha256 "cf20e96312a40d88d5ef0b0e4af5ccc6508d42ed2502d5da0fb443e95ca701ae"

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
