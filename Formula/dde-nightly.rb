class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260718.1643"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1643/dde-darwin-arm64"
      sha256 "6aa1aacc7bcc4a253d4226a93ba376b5db27004e42950153d16309aca9d450ce"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1643/dde-darwin-amd64"
      sha256 "576085ba23cb995e89bc48142055651a8602ecd31212babc7e1794af7af6f2ad"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1643/dde-linux-arm64"
      sha256 "6d5ee228a61c684e6951eff828ed89657540ec4b16e9276a33e89aef9093a111"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1643/dde-linux-amd64"
      sha256 "f8740e639ae5b11a4c529faba5ee2beb8c86bd289df1d868d0962613a3c9f709"
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
