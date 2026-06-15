class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260615.2008"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260615.2008/dde-darwin-arm64"
      sha256 "24b75f318cf59398426af6df0ed2ff2ef65357e9b1a6fa04444b29df95684812"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260615.2008/dde-darwin-amd64"
      sha256 "0e165144f17d2757574a3e0c5341c5ad7ea0a6bf3447d0d48b3de7686be39e4b"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260615.2008/dde-linux-arm64"
      sha256 "f5059afcc17d2168e064dd67111d54f5554d9c02f3cd118d98e5ba295f5c3551"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260615.2008/dde-linux-amd64"
      sha256 "8bb15142e17ff20d841db968e6248f86281cecfc13c105fb1e23fb4e19711c6f"
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
