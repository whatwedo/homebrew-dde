class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "6269052c0e109d63abd00e38cc72b937f28996d2a7dead92bedb7820483243e1"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "3825ae88f8d1fb0cee8a383c8f83a53c8ca7cc22f4ee833dd339b2a8f1dc29bf"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "c8133ab377b3f19a706ab9e2d637fc612ba7902c419e15882de853286e5308d3"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "91a311c5bac7e34a4348b2420d50c9e64f4dc9862ead2471a7eadc109bc4f2b1"
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
