class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261125.2300"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2300/dde-darwin-arm64"
      sha256 "02b5c2cfe0bad5cf0917991d300c6d3436d29bfa6aa08371b833d2d8fdd86cba"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2300/dde-darwin-amd64"
      sha256 "03f7329b2498fb845c57dd69398de3f63a8df9e5351badfa2836e19016d6c6cd"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2300/dde-linux-arm64"
      sha256 "aad4914e2c8984a73b1a4f01021424489d13a89130564ef262ba747311f17999"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2300/dde-linux-amd64"
      sha256 "dcd880e95cd221946e36d2a3642380228764c96dfc0b8dd54c459b265f5f846c"
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
