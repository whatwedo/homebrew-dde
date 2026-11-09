class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261109.0145"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261109.0145/dde-darwin-arm64"
      sha256 "81dce39a1462e129a09c1d4674c8e8996955aca1e1ce66e9c7472ec78862ab90"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261109.0145/dde-darwin-amd64"
      sha256 "fbfd0d9b0681248aa7e0bd2ae941f0d14ca86ec7f4e1d596a53818840104153d"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261109.0145/dde-linux-arm64"
      sha256 "2d3515f78fbfc8154d7d14bbaac23192a4f80a79f14ee90414a82c928e50fa3f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261109.0145/dde-linux-amd64"
      sha256 "64fef19245c01ac6cbab4015f05b62096269c2c33c78a4f269b60020051c389a"
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
