class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "29745c450132d411530e58505d05fde7774b306eba152ca5b2c6b15e3e750431"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "b4dfaf9e0e0425ce0f78ef00e20194fe654ed85ae35fc2c7725d044117cdc42d"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "20d3c61713916bf4b42f1d07c6d70403d6ce1eb5ff631902f692bd10a4767c28"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "5418064dcb17c6b1d5320bd76f37e3f440cf39da4f8fa78550820a25d25ab612"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "dde"
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
