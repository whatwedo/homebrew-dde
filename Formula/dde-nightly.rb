class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260901.2234"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260901.2234/dde-darwin-arm64"
      sha256 "b45478277d79a3c00eb3bfe27430ed231c50a1e342379a995666ed9970712c34"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260901.2234/dde-darwin-amd64"
      sha256 "65ce4eefa6173d16ff8424a613b79bed616186547117d15d02c53ba6ce771243"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260901.2234/dde-linux-arm64"
      sha256 "d1539f0f187943b7b04645d659e2ab41f27d18bad5e0d095a03944a1cb88a287"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260901.2234/dde-linux-amd64"
      sha256 "fbffc6e91a2f0366fc525b1044b39f519d8e042cde7587208fa9e2c1e092a359"
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
