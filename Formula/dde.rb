class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "c64ebf2ce8188c2336a6c083dacb7d6ebadb96e5b0caf6564c9abec5d9a498c9"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "8354c48f2e57113410766216db8408e7fdfd46468a942c81c3f98e3dfc80fe8d"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "9400874e0d814176d3ec7fc213486d730fbff0d01f3eb7ba08fbff0c0b2f7922"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "d9980d3543be201fd9f7ed8d3ae043b4e82b8a4ce042d03f91db56ae199fbe33"
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
