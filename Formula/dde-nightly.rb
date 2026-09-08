class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260908.1145"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260908.1145/dde-darwin-arm64"
      sha256 "d040c70bf91bbca94694c5350891783cda61ca7c25411d746e1d80a4f0b99226"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260908.1145/dde-darwin-amd64"
      sha256 "c39768053cf180732612fcebfc6df7690eb64aaf14633722e0fc713ab446e98e"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260908.1145/dde-linux-arm64"
      sha256 "05d4fefbc2b4941193c3e224ed32a7bff0b25504b01889965e1bf24de80363d0"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260908.1145/dde-linux-amd64"
      sha256 "7f26b973aeac5f10297c1a6baa8c4c94f38718ea2aae69d4f2822b62cf7c6597"
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
