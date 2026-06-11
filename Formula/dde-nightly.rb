class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260611.1039"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1039/dde-darwin-arm64"
      sha256 "7b1cb3179aae6d4a0ce314ec13b5af7c12da196bf4017a0d591ac38b2323ad11"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1039/dde-darwin-amd64"
      sha256 "35e761bef2eb8420c5fdd0f302d39bd1fcad055528f522c9065dcb50ba9f1fbc"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1039/dde-linux-arm64"
      sha256 "e0a0bdd355ea1bb9194b12174447e6ea3d613cdfdbbccf3c8cc55996045dfcb6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1039/dde-linux-amd64"
      sha256 "2f3f692a552b6a39d74bdb23006c9f2c6b56b508dfc87f182dd3102e473b8e72"
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
