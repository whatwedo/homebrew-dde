class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261117.0748"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261117.0748/dde-darwin-arm64"
      sha256 "56707b2f5ec02cbf58e8a32f82e4276ab387d9a98e5dff0d10bbca30ef2e1819"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261117.0748/dde-darwin-amd64"
      sha256 "a2ed6c75c7486dedae5f3a84fbc3132058b3819302f45ed44e743490a5e30221"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261117.0748/dde-linux-arm64"
      sha256 "bac2187e6f94fd711d5e2dc7c9b807c1d587d4377c102d6bc9d1739fa703c673"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261117.0748/dde-linux-amd64"
      sha256 "cc396e7fdbdd8166dd0929d540c0082ccc6ebdf03190eea82ebda8f40195a8ca"
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
