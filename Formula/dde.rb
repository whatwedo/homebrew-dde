class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-alpha.5"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.5/dde-darwin-arm64"
      sha256 "daada835aa980b6ecc6b8a21ee02a810569e4b64b2ba6b7d36ff039f8fda9046"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.5/dde-darwin-amd64"
      sha256 "7f81e49df8dfef14936c95cf5b5db2233bb26f94631c4515ae8d9a91cb57eb61"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.5/dde-linux-arm64"
      sha256 "27e7d65992de56cc64b5f73ae86c3b7b3c3019032f9410fe458a5d207057da1f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.5/dde-linux-amd64"
      sha256 "aa8642733751484f3e39cc25041d4a7c3304572a7915ca5925e6829bca35fc9e"
    end
  end

  def install
    bin.install version.to_s => "dde"
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
