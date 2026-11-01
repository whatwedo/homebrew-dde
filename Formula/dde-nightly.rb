class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261101.0311"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261101.0311/dde-darwin-arm64"
      sha256 "ad6e5a0fb2ee5645f3834710ad7a8559b843a7c22c04e76a62592677915d0dd8"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261101.0311/dde-darwin-amd64"
      sha256 "765ec486f97751958e0a2b3cad72b0e62dc977647b8e5e4cbb9bb06ad960f34a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261101.0311/dde-linux-arm64"
      sha256 "4adbaf83dbde1a6fb2518a744dab300aae5a662b2cb71cff577d26f7dd85e96f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261101.0311/dde-linux-amd64"
      sha256 "3c108664a4045bd9a380030fae35f8c863247795097d7446f99d1c27f711738f"
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
