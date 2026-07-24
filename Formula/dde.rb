class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-rc.2"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.2/dde-darwin-arm64"
      sha256 "04c8ce20f8d87a2e4ae7aefc1647d42d00c6b33face93f10b47794d6d56e079c"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.2/dde-darwin-amd64"
      sha256 "43b2996139eae33c6e8ca2e02cd5c30987a47d047bf988d6c2a71440447581f8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.2/dde-linux-arm64"
      sha256 "d5f46e2c5f9e8e30f1c5777b25e3df242fc9f9ce978ca193d619ac6fdb766d1a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.2/dde-linux-amd64"
      sha256 "b4612f4b09152ac1735009b8fa9b6a3f01b594024fa40813fc0cbd3e638cea09"
    end
  end

  def install
    bin.install Dir["*"].first => "dde"
  end

  def caveats
    <<~EOS
      After installing dde for the first time, run:
        dde system:install

      After upgrading dde, run:
        dde system:update
    EOS
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
