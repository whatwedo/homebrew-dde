class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260726.1715"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260726.1715/dde-darwin-arm64"
      sha256 "54c4f5ad05f9cab62848797c42d44557f951f5b48ea604b0856b96da6671674f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260726.1715/dde-darwin-amd64"
      sha256 "39cfdfb814c8a105c1307ca91c4778dd686ddbc7acaa0c16c0c4d3b949b6a2a8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260726.1715/dde-linux-arm64"
      sha256 "4ed6a002afba6c8643490e5741825ca6369942c95a8af553cfe94f42b3d8f9cd"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260726.1715/dde-linux-amd64"
      sha256 "1cdc4eb0bfdc62572b3540b31fec3a3f6682c9233d9bbb5006914b75137e0ca2"
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
