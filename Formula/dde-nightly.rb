class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260712.1653"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260712.1653/dde-darwin-arm64"
      sha256 "a8e3e52da025a230f156bab0b954411a4f7a516ceaee35b383ad6d64cab61d0a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260712.1653/dde-darwin-amd64"
      sha256 "487f9d528a581224050e075318f286a794604de7362a7e9e535fc732cca8587f"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260712.1653/dde-linux-arm64"
      sha256 "0fdfafc5af0f58c5cdb351cd970960e09e3bf054bc541a3e71db345d5046f160"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260712.1653/dde-linux-amd64"
      sha256 "b8cedf1cd51dfc45d31e813b0c0b5e18845ae1e9eceb4632d487c014347d685d"
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
