class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261111.0225"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261111.0225/dde-darwin-arm64"
      sha256 "8d4551363ea4e8f9230694d16423d73ef4ca23e4d60ae6c1ef5eff0a50b0ff09"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261111.0225/dde-darwin-amd64"
      sha256 "892cc50dcc3e08efd7f143cd04d37122c9ff3fe10a647b60a5b1e4c821677ea5"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261111.0225/dde-linux-arm64"
      sha256 "e73400b925685bcf2cc1ebc26ec86ae53366d30b4d90c80024b9d90ca5b4030b"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261111.0225/dde-linux-amd64"
      sha256 "1393bef37e5e284604579098454668b59a9b893f5bfbad56557c4a45a386103c"
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
