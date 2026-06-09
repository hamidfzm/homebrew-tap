class Glyph < Formula
  desc "Cross-platform markdown viewer"
  homepage "https://github.com/hamidfzm/glyph"
  license "MIT"
  version "0.10.0"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hamidfzm/glyph/releases/download/v0.10.0/Glyph_0.10.0_amd64.deb"
      sha256 "93e5d40ba44ee78563bc27e717ee954c714bbe6e63337d361a801c6c8cb53e4d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/hamidfzm/glyph/releases/download/v0.10.0/Glyph_0.10.0_arm64.deb"
      sha256 "86dbc1e9b0f29e8c20464b7e2aaa33daead86f270d65a3b0f8ebed7f204c8dcb"
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
