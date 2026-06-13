class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260613.1437"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260613.1437/dde-darwin-arm64"
      sha256 "85274fc4c7e6a21af199ee7b6cca1d3bbb52cb5a29b55a33150d7e73d5d697c4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260613.1437/dde-darwin-amd64"
      sha256 "53bd037fb868fccd8e435f0097dc6243ca8944c3f6f044d017ca1605b7d9192b"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260613.1437/dde-linux-arm64"
      sha256 "747fc2a9a44926f5f8c7382cd0d58e1e7b7f45c5929273e05e060d1d602b907d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260613.1437/dde-linux-amd64"
      sha256 "0c71e0251d3432391b7fd4091d044d20174cd6b8ba738e081f0b9ce6c819ed56"
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
