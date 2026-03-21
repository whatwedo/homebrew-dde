class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "c1739627c773523dbdb82983b769dfb76703c3a5f6a599eb2af71011123cce73"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "896085e00aa368268b8ab90d8ef5e236b9a693f62e2138bc04882e16abb06a2f"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "0f6fb5de37ba0740e19d5ff7e55dc4f7c6ec5366e153b8c61e4a6dbd9fbe9b93"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "16a3adff25066b35b944bbb92eef297754061a8e0e07815ced00ada3e38cb66a"
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
