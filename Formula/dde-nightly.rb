class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260706.2258"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260706.2258/dde-darwin-arm64"
      sha256 "3cfa04dac806fea03c0befbfc48edea4420d14c9c536c1b75b7994321f97d55b"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260706.2258/dde-darwin-amd64"
      sha256 "8dbac4a3d91fc41d369ea38657b8f172f763638be76ee7a3cc8310bf19a5762e"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260706.2258/dde-linux-arm64"
      sha256 "eb63a47f4aa744a718c24c81c7331a13abe1dd851cbbd1223ad0cb8b97d7ff03"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260706.2258/dde-linux-amd64"
      sha256 "7e34d4b3efc25c2917d50b76562981b38ef253a3b396a0be5b3d108f9da0b76e"
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
