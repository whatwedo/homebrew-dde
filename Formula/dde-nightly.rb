class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260906.1934"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260906.1934/dde-darwin-arm64"
      sha256 "0dfb4dcc3f701c567448d1814cc917b988a5e53c06fa7879bbf25fe796842290"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260906.1934/dde-darwin-amd64"
      sha256 "bc795061e6f7902cd4be45fce3e4b4592a8cabab8931ad92594dd295cad375a7"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260906.1934/dde-linux-arm64"
      sha256 "b15aee04b3b09d2dd12f5eba32a8184fc682dd0ad05af9bd292c52a5c4716b7c"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260906.1934/dde-linux-amd64"
      sha256 "23cde4c04a5a22546ca01a040e17e17928160757c8ad6f7e8ecf39e912ef2beb"
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
