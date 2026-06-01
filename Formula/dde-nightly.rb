class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260601.2004"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260601.2004/dde-darwin-arm64"
      sha256 "abbed7fddca4f6d433ad0d79dfd043cd80fe3a6334ac81e682605b69b4048328"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260601.2004/dde-darwin-amd64"
      sha256 "44ba85b29ff90339075783b7a25148687878a8aa7676b7c2d285ca60443a67ba"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260601.2004/dde-linux-arm64"
      sha256 "1cf61d13495dad628f84fa04d8b42a5aca40a6b03784462c0641488ccc6ffed1"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260601.2004/dde-linux-amd64"
      sha256 "4ef1d4ffbf8297d12764c810be8a629119844f51693dc3dbc3ffc8f057295d01"
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
