class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260723.1913"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1913/dde-darwin-arm64"
      sha256 "8fd086662a5902ebebc2f9a8fd7d2fe2c2ad6b3ef60ca72ede33d000ba5216c6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1913/dde-darwin-amd64"
      sha256 "66b29ea7ae3ffbfd6b7586019dbd94a181314b1cb061d20bbbc4dfd0d1aefd75"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1913/dde-linux-arm64"
      sha256 "9977c49158f9b2943cbad809e2c8ea82e19a48891b55aa91e510beb48c683037"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1913/dde-linux-amd64"
      sha256 "98f3f902d6ba3cc103b8d645ff5cf545ea33930bf0974485373a7255a90df576"
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
