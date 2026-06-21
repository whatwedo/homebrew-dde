class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260621.2039"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2039/dde-darwin-arm64"
      sha256 "caf791fb1c2f373baaec885987bef13dec0eb0b343c090a486f2c5025ebbe4dd"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2039/dde-darwin-amd64"
      sha256 "4bc6bdafb4dfc221dd7efaf53470fcb4be5f9bb62a77cc0366e5ae76beac2a8b"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2039/dde-linux-arm64"
      sha256 "79234006d5863e4ca7ecf43a81d9f33f38b7c94f5ac3578b8cd5083a1cbe3083"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2039/dde-linux-amd64"
      sha256 "db2cff964dc34c7a110a17a44a6a6eb21637854f9f5c67317f0841daf8709e17"
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
