class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-rc.2"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.2/dde-darwin-arm64"
      sha256 "ff9145915cb0c248c4bd5e63a65c5f40a6da6c96d706df75e6d9d4c3b791927a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.2/dde-darwin-amd64"
      sha256 "0001da37a7ec53b006f756932fda898f40636705786badaa13633f1936c461bf"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.2/dde-linux-arm64"
      sha256 "7d7680ad18fa73193f6943b447b0f5ec6e28ed5dee0b47ec20b2d49a3953192d"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.2/dde-linux-amd64"
      sha256 "67d1fc3d90b3eab6f90defd90d5cd75c62769bc304365582bb4f0887ea86cd94"
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
