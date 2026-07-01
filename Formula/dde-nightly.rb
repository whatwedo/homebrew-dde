class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260701.2207"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260701.2207/dde-darwin-arm64"
      sha256 "3f8542ad69f9f157238b853a2a7fc63354b9472a13b3edff52ea357c1fea654d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260701.2207/dde-darwin-amd64"
      sha256 "7abc5f53fb0fccb7ec5f0b1d8e916d5103789003a9697431ee477751877e2d56"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260701.2207/dde-linux-arm64"
      sha256 "62c8f5caa1d3831558b317f2bad5031cba00fd973dc5b9ed71d8991688739997"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260701.2207/dde-linux-amd64"
      sha256 "8310d65dde983b970cdf85131a542ae07df7d9dee2648e9e511ed159c75d1f83"
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
