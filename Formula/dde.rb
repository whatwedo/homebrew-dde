class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-alpha.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.3/dde-darwin-arm64"
      sha256 "e8af55dd99efd6f534ae9123313e2c01ddfb4d418c686a1a831c192c49daae97"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.3/dde-darwin-amd64"
      sha256 "d17445c9459489373befd257667cf1484da8e71382dd7e848c454a65f67776d2"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.3/dde-linux-arm64"
      sha256 "09201f45328d2f08e52690dfb0a526ae7cbe22abb86e9855debff0e74bdf718e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.3/dde-linux-amd64"
      sha256 "fc5d341be8e52df3c8ed62d79fd76661c04baf6c57cf20289cadd8beec93e411"
    end
  end

  def install
    bin.install version.to_s => "dde"
  end

  def caveats
    <<~EOS
      To finish installing dde, run:
        dde system:install
    EOS
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
