class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260623.0903"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260623.0903/dde-darwin-arm64"
      sha256 "09dff4e1a74a4768e7e8c702a7b98d782e64bf53b869cb8ae28027ad70fb5000"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260623.0903/dde-darwin-amd64"
      sha256 "3f6aa7a4d6a0910bca6de0dfa97652b951bfd2f3b79b585bc87966ca22a8f3e0"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260623.0903/dde-linux-arm64"
      sha256 "90d44b055adbc5d0f3c91da627b7063eace73c9e675f74c20e0807b146dc2e71"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260623.0903/dde-linux-amd64"
      sha256 "0d5270dcd5906bd6c5a8f0bb56286d6bbcbc90425d5d48477e123ad6a00f91fa"
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
