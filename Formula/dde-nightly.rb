class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260723.0446"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.0446/dde-darwin-arm64"
      sha256 "155dcea4a31705ac88100026065d2ba277d9fd096874a135081e3003a5758ca5"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.0446/dde-darwin-amd64"
      sha256 "26522d0c456a3f8b123324a73fde3fc33d7c6ba17b7b956fa93bd2fc2253d977"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.0446/dde-linux-arm64"
      sha256 "0d1108586e5c4eb77944cb78d67b424aeae4fb769c9432e4484510613bc997b4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.0446/dde-linux-amd64"
      sha256 "442a17ae1104c80d98c61395822de22b80f8d3762dcf0a6aaa3055814710d2ca"
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
