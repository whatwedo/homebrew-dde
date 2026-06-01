class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-beta.2"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-beta.2/dde-darwin-arm64"
      sha256 "44b8872db5778e2c4ec8041e305b1c1054fb498e53fb9ca717be9f64225a488a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-beta.2/dde-darwin-amd64"
      sha256 "4e2a51bcfd78fce6f78fbe86a1e4eae901a60b9f6d7592ff332ef351101c21d2"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-beta.2/dde-linux-arm64"
      sha256 "275a00151699605abd2eab545d57e6435f33897e4acc30a4cceccbe6982af726"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-beta.2/dde-linux-amd64"
      sha256 "11c259ccc37a443c8c0d94966fae052f7c38f318897f0257e00ce3eb8d258922"
    end
  end

  def install
    bin.install Dir["*"].first => "dde"
  end

  def caveats
    <<~EOS
      After installing dde for the first time, run:
        dde system:install

      After upgrading dde, run:
        dde system:update
    EOS
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
