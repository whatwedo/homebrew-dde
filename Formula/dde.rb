class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-alpha.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-darwin-arm64"
      sha256 "8c9fd207d4945363655f52aa73a82cba2671b32b7126701f083057cddc8202ea"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-darwin-amd64"
      sha256 "32a8d2ec1c9ce9042604b9720ce656e7ce7e2cfc96b3c08e51ff8bf7189f95fd"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-linux-arm64"
      sha256 "738c97e317eb7c2f7c4a96fa4dbd05ac5aa76cbd1b12b5f7f40409845ebfd7c6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-linux-amd64"
      sha256 "94ae976470824f84db96d47059b8eaaaba4209c3579ae6302da5b5aac5c605b9"
    end
  end

  def install
    bin.install version.to_s => "dde"
  end

  def post_install
    system "#{bin}/dde", "system:install", "--no-interaction"
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
