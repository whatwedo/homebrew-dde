class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260911.2036"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260911.2036/dde-darwin-arm64"
      sha256 "00a847d067c4baba174a4dd8289515d07ca416da1bb572689367ec2275d3ff4c"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260911.2036/dde-darwin-amd64"
      sha256 "702bf6cb899a4106c0897b509a6840a55871ea0c499639ec5ff09bf844acf71a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260911.2036/dde-linux-arm64"
      sha256 "8d55dc48b204ca5bd978571b25cb2c22c5c9d802ddb500e5c26d3152d818a4c7"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260911.2036/dde-linux-amd64"
      sha256 "07259937db262121ed1e120fd08bdcc6797b07a8370a1b7e4b0a060793dfc0ae"
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
