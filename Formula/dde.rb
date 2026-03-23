class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "d06926330321e7d588e68630dc75e3d7268cf0d0da483f3d2852c5e232284d69"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "d99f6d677c3bc56b3fa3b22896dc62a7a075d69a75beaad72b93849a9758e9b2"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "8a558f3595f888c74add934dea90c55bf8853d3eb19cfebe94bf7486a179ef0a"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "c356b55043e002f5058331f2a4e6aa3007d68523080407ad4d8f992e2dd6c8ad"
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
