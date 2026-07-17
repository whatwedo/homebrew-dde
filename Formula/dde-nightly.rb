class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260717.1805"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1805/dde-darwin-arm64"
      sha256 "c80a44d829ff4f9df72f8e09969851fb3e1f9e79a7b5ce57d012c42bf4fe3048"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1805/dde-darwin-amd64"
      sha256 "ee390c87b21bb07c21abb2d3da8147b321635d6b47d3b555a33cebd85a60cd3f"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1805/dde-linux-arm64"
      sha256 "3856ccebf5dc84c548613cd59dd6991050bfa6dd4cf390029ca6008510358da0"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1805/dde-linux-amd64"
      sha256 "90ba4260f7a99319ab7157498115c4ba23f0e25691b001a8727c8cf81c42d34a"
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
