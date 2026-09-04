class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260904.1905"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260904.1905/dde-darwin-arm64"
      sha256 "aa0024b6453503e45158a8dda683294540bd967c0c580301e7e1ed209c966865"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260904.1905/dde-darwin-amd64"
      sha256 "0948583c887dc163dca575804a032e2dec561264c68fe54fcc5e5b5a8c7db723"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260904.1905/dde-linux-arm64"
      sha256 "bf7c3fe5251f292f0f0c23efc543b82c1d44670683ac24391d7e3d461e747c1d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260904.1905/dde-linux-amd64"
      sha256 "0bb928b3ca30b00133a41d99c6d928ff3a6cac33b37e9b5de294c429ecc3ba00"
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
