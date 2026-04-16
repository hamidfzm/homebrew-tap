class Glyph < Formula
  desc "Cross-platform markdown viewer"
  homepage "https://github.com/hamidfzm/glyph"
  license "MIT"
  version "0.4.0"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hamidfzm/glyph/releases/download/v0.4.0/Glyph_0.4.0_amd64.deb"
      sha256 "44a6f1d13bbcbae01b9635fc5e71dee62be8d725b257381f47d3482a5c3d1bce"
    end
    if Hardware::CPU.arm?
      url "https://github.com/hamidfzm/glyph/releases/download/v0.4.0/Glyph_0.4.0_arm64.deb"
      sha256 "2b05aa6b7acedf120328da70ff24af25b3cb1a806557c93f143e900d081ca074"
    end
  end

  depends_on :linux
  depends_on "webkit2gtk"
  depends_on "gtk+3"

  def install
    # Extract binary from deb
    system "ar", "x", cached_download
    system "tar", "xf", "data.tar.gz"
    bin.install Dir["usr/bin/*"]
    share.install Dir["usr/share/*"]
  end

  test do
    assert_match "glyph", shell_output("#{bin}/glyph --version", 1)
  end
end
