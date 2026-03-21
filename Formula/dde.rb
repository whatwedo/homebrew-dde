class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "45d05e9cd878ea4771284b74bf663676d5100a3ca5ac2971c77f21dc572d4b97"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "699957832ace657438eefaa758652625f037a20b13754428050880d5f346e6c0"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "f7521333f4b453fc88f5c621b10077493d4f1bd22df315330925abf532038706"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "65a3ead5fc029a4c5e62e7fc0039c2bc3fb93bb8c128e1347e0d4272d9b29d02"
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
