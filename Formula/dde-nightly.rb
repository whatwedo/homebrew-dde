class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260707.0725"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260707.0725/dde-darwin-arm64"
      sha256 "3daa5a99fa51ccf23b8eda6f4e39d0b67357b376d2f6da8876ec6f48e3edc3d3"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260707.0725/dde-darwin-amd64"
      sha256 "7ac68c3299821e5947c2846e92d11338d4f04d0145eaaf9d67e6a26bb6bd0690"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260707.0725/dde-linux-arm64"
      sha256 "51cfc57bdc9b43b362eacda5107ac39c21f73eed3e6435fa5e1176c39e3d281c"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260707.0725/dde-linux-amd64"
      sha256 "8ea71596ac1a0ba40ec6c42f0d65f2c995a4753d611f61f47267827b2181d671"
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
