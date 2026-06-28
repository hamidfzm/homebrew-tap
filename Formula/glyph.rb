class Glyph < Formula
  desc "Cross-platform markdown viewer"
  homepage "https://glyph-md.github.io"
  license "MIT"
  version "0.14.0"

  # url/sha256 must be defined at the top level so the formula parses on every
  # platform (otherwise macOS taps fail with "formula requires at least a URL").
  # `depends_on :linux` is what keeps this Linux-only at install time.
  if Hardware::CPU.arm?
    url "https://github.com/hamidfzm/glyph/releases/download/v0.14.0/Glyph_0.14.0_arm64.deb"
    sha256 "1c0b0730b0d0be346fb0f383842b7691bda0eac9602e2b7b8dbc681776c82732"
  else
    url "https://github.com/hamidfzm/glyph/releases/download/v0.14.0/Glyph_0.14.0_amd64.deb"
    sha256 "56b52520b76a084711c6d4001e28d573d7de776427c499cf4c6813250ecf23df"
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
