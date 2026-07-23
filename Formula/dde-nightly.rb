class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260723.1926"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1926/dde-darwin-arm64"
      sha256 "eb6210dacf1c2c969d7082b3bef82285d63f261a64a84daa12d588c1c3608e5d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1926/dde-darwin-amd64"
      sha256 "4d472ec3a674392d38d416a17c75edc34fc1d1442eda9d7b9598790f093a89c2"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1926/dde-linux-arm64"
      sha256 "72d55cf699676efd9be2dd78055242b94d5821ec590aa28eb23f717af76d5721"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1926/dde-linux-amd64"
      sha256 "853b762d9905d7a437d2c5f078d1f1d0aa405760ef512c5be101005d5aba255b"
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
