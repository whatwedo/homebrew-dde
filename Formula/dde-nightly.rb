class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260521.2145"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260521.2145/dde-darwin-arm64"
      sha256 "776976311af36b4a72e68a6e432d9c74e88af76d893814f97db9f451f6cd60b2"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260521.2145/dde-darwin-amd64"
      sha256 "0d21f9da3b29393c8564d730683415230e5ef644465e60fd10bec796b4a9564f"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260521.2145/dde-linux-arm64"
      sha256 "be14112d70318d9e53f7218a29763ec320c51c676112e054552a0a7a3fbca393"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260521.2145/dde-linux-amd64"
      sha256 "858cc0709579ca956985a6d65b434c79d7398f6aac8761ecea04e84f26c04db2"
    end
  end

  def install
    bin.install version.to_s => "dde"
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
