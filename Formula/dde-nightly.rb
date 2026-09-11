class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260911.1341"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260911.1341/dde-darwin-arm64"
      sha256 "3f3ad00f50bf6126cbd4727dfe57ab7269e3b90263dcd5ddf3bfa53d2c700e84"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260911.1341/dde-darwin-amd64"
      sha256 "f6d72fac2a33edd7bb2480503ceeb86911b7a3300daaa0f4fd3bd6611d2e42b8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260911.1341/dde-linux-arm64"
      sha256 "d1f0a583dec3eca12fe1677183877915b53ad4ac4f16e6374ad05295caf2eca8"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260911.1341/dde-linux-amd64"
      sha256 "0befbc757e7e7ae193444f329150660160160c607baafbfa850ddd1e8b13e251"
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
