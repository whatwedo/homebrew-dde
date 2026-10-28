class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261028.1843"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261028.1843/dde-darwin-arm64"
      sha256 "53e06da37985a1dd32fe706f7e7eb4dcaf611b256e5e6caa2638eecdaa419935"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261028.1843/dde-darwin-amd64"
      sha256 "faf3466862c37c63c180f39c3a0e527b2412e15dfb0d6e0f6e3acdfebc9b3260"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261028.1843/dde-linux-arm64"
      sha256 "764bb77cbe7038a7f976cabe1d256e51c7e22e0d549e4eb5c4a161271f9fef5d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261028.1843/dde-linux-amd64"
      sha256 "cf0452bdb1ca08bfc901f504f19c565b525c85dcab02680add4bba645349b27e"
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
