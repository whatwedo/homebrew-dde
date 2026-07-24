class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260724.0808"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0808/dde-darwin-arm64"
      sha256 "b2586c9c8aee46cc34f2756cb35219e581c37a52ea5d2c8bb574afb257cc2ab3"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0808/dde-darwin-amd64"
      sha256 "82ddda4bc3c9efb544e9115d082afcf111b4bf8cde05963b01f5a703d4ed35b8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0808/dde-linux-arm64"
      sha256 "848f346bca4f5e0b328bb75d4a6a426d94b49a93595ce19a34bd1fc887b3b2e2"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0808/dde-linux-amd64"
      sha256 "fbb5d655de315dfaa50f16bd163971107ff60026460385aa7c77e4e6cf215486"
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
