class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260821.1913"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1913/dde-darwin-arm64"
      sha256 "672c8f3f1eaccb20714e897d145b614003dfec14d480bd5f835285b7de3e3047"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1913/dde-darwin-amd64"
      sha256 "efad9c239436645f8f009b841d76f0b4bf22023c708520ca039b792722fb2166"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1913/dde-linux-arm64"
      sha256 "a13d55647e7affb4b3b6689c57279861d845052a3a8c33900478dcc3c72d88ba"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1913/dde-linux-amd64"
      sha256 "93cbdcd1d1d8986138fac886ee0f9687c84fd232477db8b3fbe6036642188da9"
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
