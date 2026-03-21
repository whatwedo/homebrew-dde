class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "50749e8e1b84b87732ecee45704eac7e2ff729a419d055a7dad6f45379f915bf"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "4023752e8f74a4a7b9f28d9e250dc2259f12a414fd0ad03065a9199f7272999c"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "631780878d2c24253e9aee021f7636a490574355c088d399793d2af5cd2eb6db"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "163988475806388df11c57114bda5931e7c2f94973a5882b31c8e760cd3fb6e1"
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
