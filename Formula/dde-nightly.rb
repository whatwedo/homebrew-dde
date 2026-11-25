class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261125.2307"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2307/dde-darwin-arm64"
      sha256 "71b3349d1d0dee49be4dfaefb394cebb0b6a1d4bb31e14a477aa581d227641a7"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2307/dde-darwin-amd64"
      sha256 "bb9b96aecc3b81263c514fb12edc3dfe5b8a101cbc264dcc6f80e4264508d31c"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2307/dde-linux-arm64"
      sha256 "f8b86912c89f1d7abca896ed37e37a13e03ff2cbbd91ed5e62ce5d39444e36ef"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2307/dde-linux-amd64"
      sha256 "01a59ff4b6db6b81ba3d8cbe269bec176285801592a99adeff2fbe80467f00ca"
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
