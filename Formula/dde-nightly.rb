class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260611.1055"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1055/dde-darwin-arm64"
      sha256 "778d3bf93164d387246342c2c93b453156b59423456c18d3cd4c02d9f1ab95b1"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1055/dde-darwin-amd64"
      sha256 "3697d89215b48d125e098f6e10dfff60ed90598e97dc245fdf38cb2ad62140d8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1055/dde-linux-arm64"
      sha256 "a928cad965aac81961ca9eb3baa157633d89cd7cfdface4ab463cd2d8358ccb4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1055/dde-linux-amd64"
      sha256 "e10d42c524ac43b2ba8adf2d1374003459654b359e312dd34240dcb9dd8d234f"
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
