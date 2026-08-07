class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260807.1346"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1346/dde-darwin-arm64"
      sha256 "2e2c973b854b692b4c46f21f8f1d080e8df1bcd42252f6e47264a3814f68a352"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1346/dde-darwin-amd64"
      sha256 "a32997a7b69faac983264f1c5939a3849d9ee2ab21f8eb272c7c76809fad7a50"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1346/dde-linux-arm64"
      sha256 "4d551da0fd1aa4480e41c723dc6b1b3de752f632e1b4aab9b1c24b7440f537da"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1346/dde-linux-amd64"
      sha256 "83c5ed22344802d8eb0380f030c2e4fc5fd748a3d9653fe4ecde45574508476a"
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
