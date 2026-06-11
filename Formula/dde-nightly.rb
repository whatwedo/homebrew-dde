class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260611.1158"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1158/dde-darwin-arm64"
      sha256 "47cacd227d7b96fd76c50c1456c96f01719fda130b59444ed2b2b6514885ef19"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1158/dde-darwin-amd64"
      sha256 "7f0633c924bea2057f46857402285f7224da1efc1482158eab7f1e220f86a187"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1158/dde-linux-arm64"
      sha256 "68c44378af2494776763bf264aed077f90ff2510469c7707c814ea9600e53b57"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1158/dde-linux-amd64"
      sha256 "2bcc7100fcdbc4ab287a4a80e32cb1de9adecdab0f1413a74e1bf2ad6c492505"
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
