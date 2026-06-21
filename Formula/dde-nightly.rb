class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260621.1734"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260621.1734/dde-darwin-arm64"
      sha256 "607cb8202a10786c06247ca8fe177da11b1fc88245a79691eead9e19f85446aa"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260621.1734/dde-darwin-amd64"
      sha256 "17246a1d07c35a3985dd13b4c5ae93bf64653bd302e13b0c0644a1ece44eda0d"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260621.1734/dde-linux-arm64"
      sha256 "60025c6a92b2ce1c51e8f5257fddedc9fa3f9997b49ed32fe583a2d8c664044d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260621.1734/dde-linux-amd64"
      sha256 "46cb336e1885cdc4e68d554edaae52c8ac8360a5a14205ec48fcb11f7563796a"
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
