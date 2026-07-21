class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260721.1757"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260721.1757/dde-darwin-arm64"
      sha256 "14bdcdec6d55ff4cceb1dde1aed29cb326c17f350aa7a25d768921f86e781097"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260721.1757/dde-darwin-amd64"
      sha256 "697cde2d7bd0f07a6f7501eb2ff67989ee4b7066874ecb160b0dfea2384f1fd7"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260721.1757/dde-linux-arm64"
      sha256 "29f506226f4f47546bce80c7838c8592056537d54a91573f65ee9be52e951c00"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260721.1757/dde-linux-amd64"
      sha256 "8943a64b56c80a7ae607e591a1a171fd1e3359a724142c012bb0e9e200b0c156"
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
