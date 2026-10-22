class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261022.0836"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261022.0836/dde-darwin-arm64"
      sha256 "ff66e19c76d8873d35fc96b0e66977dd805ac1e85877838336df9601c5bba20f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261022.0836/dde-darwin-amd64"
      sha256 "5bcce2ccc306b429c2c9c6455e0ff1ba4066a4d570cdbffd4a383fb021469708"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261022.0836/dde-linux-arm64"
      sha256 "04cbf01c3d6bf20e9a7e098c07c992a26e23d98d6b219b99ab778c70c88daa28"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261022.0836/dde-linux-amd64"
      sha256 "ce4de34dd9eaa2472749ff124eac6662ce63b9346eb70e7d95eeedf01953b5af"
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
