class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261028.0238"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261028.0238/dde-darwin-arm64"
      sha256 "a136a0f07c2d9853fa61a2e3b1976e536bdac34ec367365694d6c56783c83da5"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261028.0238/dde-darwin-amd64"
      sha256 "3fd686d3c2e7c7410e8f39cfe7ac2cca98c2b448cd0cdb9ae6116c9fb3bb0d96"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261028.0238/dde-linux-arm64"
      sha256 "bc58cc676ff66788853583232f2d660ecd1f4a1d9d64cff0bfbbf6f343d65d84"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261028.0238/dde-linux-amd64"
      sha256 "9d138dcc34a79ae64dbc6da35aee8c3bd5ac366934f8cca34b210349e94aa9b0"
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
