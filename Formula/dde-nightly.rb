class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260724.1654"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.1654/dde-darwin-arm64"
      sha256 "06b56c6b78bbc38a4817eb851d91b755b2eba918e2c80174b7bc98764396bb04"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.1654/dde-darwin-amd64"
      sha256 "16fc8e69bf3f5d9cde42c286bdbd107719f4fc64840ce892d3a253370b3c7509"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.1654/dde-linux-arm64"
      sha256 "62331d37a2f7512d5736c65c330becc2f71fb4c23d777ed07ace546b26ded882"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.1654/dde-linux-amd64"
      sha256 "fa179be163b60a14bffe259d3df3d29898084ef2106c00c48a42abc78b9a7682"
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
