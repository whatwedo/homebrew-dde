class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "1155f7f5dcadec4efa5088bbeca116906d6073adac16b99c5be75619ed487227"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "efc5152a7e8251cfb066ad8a289d0aaeafafb37aa61931db1e5e674e2fe03733"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "ef17dc8f6633988c56b0d12ce035ea40cbd7da22938159bc6fad7ae9d7b955c8"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "b770784090b85483096bf3e0809f985c905bcc8c8bbb1f9e274a9bb2714b29f7"
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
