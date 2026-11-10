class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261110.0332"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261110.0332/dde-darwin-arm64"
      sha256 "ebd7c7cbfc01c93f94f6fe63365a4572963b6a104bcc5352b0ea00afdd0a6057"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261110.0332/dde-darwin-amd64"
      sha256 "16bcddf976c1a84e82d269dc7989250e0b0b128b3617741e09df7c6a26838348"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261110.0332/dde-linux-arm64"
      sha256 "32cc3a3172045967a6de43426304329806880e405a0454cce337d3303245c96d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261110.0332/dde-linux-amd64"
      sha256 "7cdd4af090f43b701a1b6ba7331c910490df6df0506b4f9be198cadeefb8402d"
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
