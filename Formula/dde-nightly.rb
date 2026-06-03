class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260603.0745"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260603.0745/dde-darwin-arm64"
      sha256 "f05607ffb7db35b21b66abd5018a6e9894069eea6ecbcd245b0934196a8b28f4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260603.0745/dde-darwin-amd64"
      sha256 "c47364fd535d701cb1fb305e02ee5e9ef068c4ecd0bb0f5dca5289314824bdd3"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260603.0745/dde-linux-arm64"
      sha256 "df67f9b587fca4ace662b2cc74ce0ce4bf4801d6814a53eec37ca88524df3210"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260603.0745/dde-linux-amd64"
      sha256 "531a9f95b765ede24235c2a919279447b4725458ee29181804000bf6f6e37d35"
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
