class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260611.1107"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1107/dde-darwin-arm64"
      sha256 "ff2feaf7bcdf05430a22b78e2e2db1e6110a5102f4f4502038f66e25a9faf0cb"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1107/dde-darwin-amd64"
      sha256 "afcab7e3c1df0e57d4d51a1c6b3ab5a4cb77b794e543cd70b28232e465f3afa7"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1107/dde-linux-arm64"
      sha256 "236f3f8fcd98ffcfcca596ff03fbdadc6f6370b8b7d2cc9fe4d4b317becccbdc"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1107/dde-linux-amd64"
      sha256 "e67ec1ee5ac760698f0304494cdb314dd00739688983dd01dd9d400636cce472"
    end
  end

  def install
    bin.install Dir["*"].first => "dde"
  end

  def caveats
    <<~EOS
      After installing dde-nightly for the first time, run:
        dde system:install

      After upgrading dde-nightly, run:
        dde system:update
    EOS
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
