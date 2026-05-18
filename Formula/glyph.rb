class Glyph < Formula
  desc "Cross-platform markdown viewer"
  homepage "https://github.com/hamidfzm/glyph"
  license "MIT"
  version "0.7.0"

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hamidfzm/glyph/releases/download/v0.7.0/Glyph_0.7.0_amd64.deb"
      sha256 "d615f1e9063f27f5af5ea3bfa483e2cb0975a408ff5ba22534c554e176dccd7b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/hamidfzm/glyph/releases/download/v0.7.0/Glyph_0.7.0_arm64.deb"
      sha256 "d7247e8181cf1be5adacbed18726ad79f8aebbad3b4c62db529e918efb2a76c6"
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
