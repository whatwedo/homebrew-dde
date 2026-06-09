class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260609.2031"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2031/dde-darwin-arm64"
      sha256 "30e1c6b23b3179a0ace0eb5727f8cf41843cca01f05f16c128b4482946c58991"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2031/dde-darwin-amd64"
      sha256 "bd80890273071b7274585a14f2f1d86b13cb1e91ab316a5c797993c24830c694"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2031/dde-linux-arm64"
      sha256 "d9e19b8b995dad6ce4a4c0a427b882f57bfcb001a16c1ab4392694e5690d6ecb"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2031/dde-linux-amd64"
      sha256 "07c50db73d20c2f800842d522bb4e78fd44d519a01dbf2f5768c9b6153842184"
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
