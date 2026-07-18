class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260718.1048"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1048/dde-darwin-arm64"
      sha256 "a40de8343df0b44d3ff5c9f5b661a6b508f4e01974259ca7b6de7eee1d0faad5"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1048/dde-darwin-amd64"
      sha256 "28877969367c931d944eb8a52917a31d569b68e51a9b667c952e905ce26fb486"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1048/dde-linux-arm64"
      sha256 "d56cf5094f797fab2782941cb94185807da87f2ce1f768911393d8c1332d0592"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1048/dde-linux-amd64"
      sha256 "e4255a415df2b25eb29ca9ec13f9ded7508df6c4628c65dab9c944403426d5b4"
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
