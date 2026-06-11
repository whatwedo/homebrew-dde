class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260611.1013"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1013/dde-darwin-arm64"
      sha256 "e1bdd9917a29372bf589416061403f2d13154910fbd1d402e4dda688c08e5ffb"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1013/dde-darwin-amd64"
      sha256 "424b61f77c1b1171e61ac53666b6808694dc0e839cb6440f761f61691be7a449"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1013/dde-linux-arm64"
      sha256 "f6577009e5e5beb9fe96dde19e9e60dba8a45692caa5b8ac635c9175a039ce66"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1013/dde-linux-amd64"
      sha256 "e2ede40fd4cfc89d989d069d2df472323813cf5a6dba02c5cd2c45ceff69c32a"
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
