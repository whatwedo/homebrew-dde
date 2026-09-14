class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260914.0138"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260914.0138/dde-darwin-arm64"
      sha256 "56455468ff403ffdeed990fbd5c690ec4b9f4e1edf3e9ce8b921f844e40a3d66"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260914.0138/dde-darwin-amd64"
      sha256 "e03080857597f139d1df4f9dbdf4be65cdce319db062a2b389c507107dd32896"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260914.0138/dde-linux-arm64"
      sha256 "9ebad552d2d1259eac2528f9eb23e9fcac99b28888a624905c94829f2885df74"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260914.0138/dde-linux-amd64"
      sha256 "8dbe695733bb41317dddea7904ad33364cf131904b51e832a1d644f0577a3f57"
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
