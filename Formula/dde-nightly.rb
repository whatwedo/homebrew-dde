class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260610.2216"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260610.2216/dde-darwin-arm64"
      sha256 "b958aa0e56de75e8a3ef9add0e165cf66a0d8d568bc9193f92a7dc9f2355aaa0"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260610.2216/dde-darwin-amd64"
      sha256 "afc88d883ee0b305e63ce07059d7372e05fcd4daf7f756da2ad05877d28f204d"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260610.2216/dde-linux-arm64"
      sha256 "5ada099e57c554eaad6e2e641d21743b2de00ba298024bb31b9f56e0485000a6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260610.2216/dde-linux-amd64"
      sha256 "4e6586db310f080bd5809e05f998a7bde2ea3d922617cc5480afe14c34a8f6cd"
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
