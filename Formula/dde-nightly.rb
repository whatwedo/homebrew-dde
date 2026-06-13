class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260613.1800"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260613.1800/dde-darwin-arm64"
      sha256 "15a3e209235b9e4821f23cd77f0d4423f94ff3357ceaf59b2ba0059385277ac2"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260613.1800/dde-darwin-amd64"
      sha256 "53d0412ffa03bfa6ba98505d5302c2eb6aa18d714015a8f1629d9215d4689ece"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260613.1800/dde-linux-arm64"
      sha256 "421b4646c20909b4090aac331833cf8b2525dead88ec117db8c9bd27db2ca4c6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260613.1800/dde-linux-amd64"
      sha256 "7116e60fe29412499b6b9d6397289c5be2a11a294364fea31e061caf4aadd9bb"
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
