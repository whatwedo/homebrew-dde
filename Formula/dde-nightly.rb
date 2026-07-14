class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260714.2009"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260714.2009/dde-darwin-arm64"
      sha256 "590f6ed5acd1a72f30a66572d41106e22941002106a74749637c1fd75123619f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260714.2009/dde-darwin-amd64"
      sha256 "720725a3d085eea305f99141b1a2a87f75de2fe47e7328649b0f170de011a2d8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260714.2009/dde-linux-arm64"
      sha256 "94644f5e6966204a79be9807c07a1894ad4f9ed01f887de3c3044be45e22d5b4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260714.2009/dde-linux-amd64"
      sha256 "9620cd2d5fe45ff692d1530a4de5a2e46a143bf8a8855e4eb24cc4fefb31f8d8"
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
