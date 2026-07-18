class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260718.0929"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.0929/dde-darwin-arm64"
      sha256 "00d48a89b895bdbe9a6b90ea70630df96b4eacc57eae2a2e5fc419712b4182ba"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.0929/dde-darwin-amd64"
      sha256 "162044087ed6002f51688ac5aa73fe5e222170d45fb2480d2026e52682098a08"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.0929/dde-linux-arm64"
      sha256 "86ef3bb4c3513e0bc2ae7cac7a51d32ae5eae8bb799895daf46cc27ee45e5dd1"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.0929/dde-linux-amd64"
      sha256 "213dc65c8f3038bd1bcf2116f3eb7c13eb382ed6142b96df3e3f29db81542610"
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
