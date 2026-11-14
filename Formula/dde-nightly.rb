class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261114.0214"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261114.0214/dde-darwin-arm64"
      sha256 "2e2c14804531ec6b3a528dd6680f4ace262a6de005ba9fd1638b76fc9b70b5b7"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261114.0214/dde-darwin-amd64"
      sha256 "f46974085ae22a2ecd454e8f24fd71c4b2b35fd84ffeae6a2eb0622a8488519c"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261114.0214/dde-linux-arm64"
      sha256 "c7271c1c0bfe800ca7a262b12e45f502ede5e12afa2b8942482436b8c1cd1885"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261114.0214/dde-linux-amd64"
      sha256 "a52c089e2818cea0e98b45e03d387e419d6ce1e70a02ef536417a1b12a7db605"
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
