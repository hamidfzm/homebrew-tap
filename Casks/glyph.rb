cask "glyph" do
  version "0.1.0"
  sha256 "247410fed205a2186d9ae053b1de55f6fef6e661cb296ad518b1dea88ed1d70c"

  url "https://github.com/hamidfzm/glyph/releases/download/v#{version}/Glyph_#{version}_universal.dmg"
  name "Glyph"
  desc "Cross-platform markdown viewer"
  homepage "https://github.com/hamidfzm/glyph"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Glyph.app"

  zap trash: [
    "~/Library/Application Support/com.hamidfzm.glyph",
    "~/Library/Caches/com.hamidfzm.glyph",
    "~/Library/Preferences/com.hamidfzm.glyph.plist",
  ]
end
