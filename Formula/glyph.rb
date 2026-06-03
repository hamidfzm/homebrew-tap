class Glyph < Formula
  desc "Cross-platform markdown viewer"
  homepage "https://github.com/hamidfzm/glyph"
  license "MIT"
  version "0.9.0"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hamidfzm/glyph/releases/download/v0.9.0/Glyph_0.9.0_amd64.deb"
      sha256 "372b88fc587aeb82fc4fa71131da741a6c17c23ce5154b923589dc8c9d73cf92"
    end
    if Hardware::CPU.arm?
      url "https://github.com/hamidfzm/glyph/releases/download/v0.9.0/Glyph_0.9.0_arm64.deb"
      sha256 "ad58584c390aeab546e325f4b2725da4025ac729299676e98c837c8f99eb6e8b"
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
