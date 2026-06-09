class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260609.2050"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2050/dde-darwin-arm64"
      sha256 "aa830749035bff1fd78fb6675612b21e2ac0d9e218f04a02a2a588dcf8fc476f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2050/dde-darwin-amd64"
      sha256 "b9b2a8c7b16e2a99bdae92cc4abb3668d36b2017f5dd12c9a32df3acc89b42dd"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2050/dde-linux-arm64"
      sha256 "eec1249d4ebbea3d849e6b81cbcbe42fde2cec176b5a743624d1fb10784b788d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2050/dde-linux-amd64"
      sha256 "071e70572121050ff12132e187d35750182d291a78aee9a8db05914646100a2c"
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
