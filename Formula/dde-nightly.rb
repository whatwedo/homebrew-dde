class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260904.0556"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260904.0556/dde-darwin-arm64"
      sha256 "43002f4e69677cf73a947c4a826624c9f40e216a90c970076c7ab60f8c10ad6f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260904.0556/dde-darwin-amd64"
      sha256 "8f7fb5ed54bc1e4201bd4d59e72f6959db2e5c7c13688d4eebb9ffc7e009fb0c"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260904.0556/dde-linux-arm64"
      sha256 "5240520796dec50eba9ad92c9d0d97ee7a99ff8615659466f50b81f8927801d4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260904.0556/dde-linux-amd64"
      sha256 "c03eea18cea22522e8def6e6dbd4ff90700d52ec284b861e8adfbc689c280f40"
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
