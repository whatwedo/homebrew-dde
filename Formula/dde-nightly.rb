class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260829.0942"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260829.0942/dde-darwin-arm64"
      sha256 "8eb01b24bd1e567ee5a715e5c66ee3014f1b676e7ba7b0f8fbf8d46d340631ab"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260829.0942/dde-darwin-amd64"
      sha256 "a005ac1c5ebb36fcac5901eea1bc8550a115283abbac95fe703bedd282a381b8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260829.0942/dde-linux-arm64"
      sha256 "34ee86603f78080786319d3cbd00a7f13290f60197fbd563ab950af16657577e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260829.0942/dde-linux-amd64"
      sha256 "8d4bf13d33ba40a9db2fbf082af390e4714bbf1e7b536ce04b9322b92e226236"
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
