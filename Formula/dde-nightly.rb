class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260627.2152"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260627.2152/dde-darwin-arm64"
      sha256 "6ef9a12443c8bb1737fe6a206a6a4fc5145bcaf1f74308fff5d1502bdbdf5869"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260627.2152/dde-darwin-amd64"
      sha256 "e10046f56daa4e62bff82e94cbe835f7636b28001f89263a6e7c208a90af3f4b"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260627.2152/dde-linux-arm64"
      sha256 "3a7aff07d2337f8e56413a27005d61c8c8bcf0dbd600182c3daed7c476aebced"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260627.2152/dde-linux-amd64"
      sha256 "0971dc462d95d3f166695f69122144732b3c122d9b299a293125eb2696534c4b"
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
