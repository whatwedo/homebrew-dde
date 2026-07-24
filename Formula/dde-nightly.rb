class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260724.0852"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0852/dde-darwin-arm64"
      sha256 "bdf8af0324456b06e6d8f8457f2bb373b1980cfa0661f9ac781dabba25db93c0"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0852/dde-darwin-amd64"
      sha256 "f38074f44b2b77edc09dc98d957104ca52c260d99fdbd0e1a3840b7a3ed44a69"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0852/dde-linux-arm64"
      sha256 "326ce4e62ce5673e8fe47c1a82db50000b8cefabfd8c12b0cc7d318a64c63d69"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0852/dde-linux-amd64"
      sha256 "daceab17b3087b64b92f9bf2f62afd2798e59a3f169283da47f5cda074782f70"
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
