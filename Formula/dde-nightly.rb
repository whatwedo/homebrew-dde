class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260810.0742"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260810.0742/dde-darwin-arm64"
      sha256 "ca8a3ebb72d6b69294ccc8e496f46c92111c1f1bd11b0447e4b376a23d6b2441"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260810.0742/dde-darwin-amd64"
      sha256 "e49e43215508841303a8fd8e19cefa72e8102830cf7a995a33787c2eb53cdc91"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260810.0742/dde-linux-arm64"
      sha256 "20f5861934ef0f1a85ade554b7da9ab63373d89e96c5150ec988d41c69a7503e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260810.0742/dde-linux-amd64"
      sha256 "2d3f99f045de9ec69c27de1a7a93d2e9568f3a6bf028b841bc6eb99ee4f884af"
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
