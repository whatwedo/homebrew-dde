class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260611.1116"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1116/dde-darwin-arm64"
      sha256 "9a396709e506e6a39f5cccb0412e90d903b767f447e81cca0b60f01259ae7e64"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1116/dde-darwin-amd64"
      sha256 "572bcc6d3aab4fcbd0adc418f53cd8ba44940c6373593725524db3b0d51a1d31"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1116/dde-linux-arm64"
      sha256 "7c602c340594e4583750b79a157e64250832842d8bb732b6e8dccf0314f4499c"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1116/dde-linux-amd64"
      sha256 "237e0f0fb20959d377f3ee9dffe74ce29ca75bba99b651863d21562b44ba907c"
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
