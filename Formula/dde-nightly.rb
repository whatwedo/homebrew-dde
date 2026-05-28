class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260528.1152"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260528.1152/dde-darwin-arm64"
      sha256 "da417c559a3c628d9fdf9577edee549e3a3b5c8434f344fb17560497b416a68e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260528.1152/dde-darwin-amd64"
      sha256 "41fb9b1ed7bdd33c6c3d93c9588ddf901b6d4b6a8f7a9dc91c195f1bb91a12cb"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260528.1152/dde-linux-arm64"
      sha256 "2383af0e34cacdb50a7985748e5b2d16c9e285483931493255e4f9a730357066"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260528.1152/dde-linux-amd64"
      sha256 "efa5a06ad5cb0c079c5105734f8ea673668625f6cf5049deca392e79a70beb03"
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
