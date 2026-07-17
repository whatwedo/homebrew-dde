class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260717.1834"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1834/dde-darwin-arm64"
      sha256 "acab5bdf7592024f934cf6fa495ff0849f104b1c7ad7b56973f9db51bd06b1be"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1834/dde-darwin-amd64"
      sha256 "6993e7b2c20f7dbc314fcf2a659a807ab8d69ecbcbb50a702216644cc8e66c24"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1834/dde-linux-arm64"
      sha256 "21daf148075442fa622ffe66f20a9aca4dcb72931a7ded32b663069c613349d0"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1834/dde-linux-amd64"
      sha256 "2602289953c70f024e46e732046cee89b0a99bdd0a0f0e2d0e42aa115fd2be01"
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
