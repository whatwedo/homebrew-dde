class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261013.0543"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261013.0543/dde-darwin-arm64"
      sha256 "4d89b85391e5c5055b4d1a2a8d4090e72e33433eec945d684b7c97bc3a79068b"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261013.0543/dde-darwin-amd64"
      sha256 "a839bff0f86d7e8ce2a060323f0376ed257a11fccc5a81f271e4ebdff65761b4"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261013.0543/dde-linux-arm64"
      sha256 "40106348ac7a8f0b8dbfa0ca0f6554d200c9291073e324aeca3ec21170f5f25d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261013.0543/dde-linux-amd64"
      sha256 "6425264afa30214915552fdfef6e9f0cb9281891e5e3e907112b6674d6a3109f"
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
