class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260717.1822"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1822/dde-darwin-arm64"
      sha256 "9830092ff352acbfc1d9afd06dd4493ea5b1e9061e65745017420932624a8c2d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1822/dde-darwin-amd64"
      sha256 "7626a46772bd20a1cde793e1c2e4d28b7bf34dfe4a5ec9fff1be51407960b5f6"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1822/dde-linux-arm64"
      sha256 "1f53f77041751fba740ae5c75b88b870b08b0507a2e6ef8d92227c7cd4636be9"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260717.1822/dde-linux-amd64"
      sha256 "e431d77eb65a08b2707d9cab8f1eaa5ce7838188e718ebeca441e9d84c260d8c"
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
