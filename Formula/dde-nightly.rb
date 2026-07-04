class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260704.1228"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260704.1228/dde-darwin-arm64"
      sha256 "c276266ec8d78b5e8dd0346ca37887b0237a3e042554cdb644d2cbe77ff21234"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260704.1228/dde-darwin-amd64"
      sha256 "6b35fed3fa528caf3e10d1da086d556a9e037e7b072baf5ff3281a31fcd48d20"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260704.1228/dde-linux-arm64"
      sha256 "4a85e412f1d241613c86cee8988176a517eaf6abd5eb596191bb4926a74b5bde"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260704.1228/dde-linux-amd64"
      sha256 "70b91dfafa073d70d25bb73a64a75eb11224ebc43ec3dbd1a67547a1c6ba33b4"
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
