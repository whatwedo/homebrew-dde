class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260611.1124"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1124/dde-darwin-arm64"
      sha256 "56e1afa1143d4901f0befea5228ac2a0e91b7168e6013073db16010e9bac9ab3"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1124/dde-darwin-amd64"
      sha256 "8acc2767e8aed65f5b122f758a9ffbd84ba763d3738a33506de5c092541fc408"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1124/dde-linux-arm64"
      sha256 "0b089002aee24272ea7109e41afa69d7413aecba97ce61ad1e8eb671ce3e13a6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260611.1124/dde-linux-amd64"
      sha256 "1258f7c387839d174d779a517bebbcacc4574cdd09e0e212485721668c27afb0"
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
