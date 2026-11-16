class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261116.0813"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261116.0813/dde-darwin-arm64"
      sha256 "8576a377edcc0b2c5317c01761073209de45e9fefed109d377468a61afb64d52"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261116.0813/dde-darwin-amd64"
      sha256 "2e5e3809cd88c6cfa4fde6d539a2c08bd929cd9696a1eadd0f923db252132e02"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261116.0813/dde-linux-arm64"
      sha256 "9d797e5ec35c94e1db27000dcd1fe4c50df5e9ff89042a6232468e8d6fcf8e11"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261116.0813/dde-linux-amd64"
      sha256 "909505c578454dbc85762a7a3bc7bb1cfbf60192c90a1452620b63a900899914"
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
