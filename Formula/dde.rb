class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages-test.dde.sh/homebrew/2/dde-darwin-arm64"
      sha256 "175d63207c6ff7c0b449889b0346885efa20b73d7ff92ea91aef6c8c24463565"
    end
    on_intel do
      url "https://packages-test.dde.sh/homebrew/2/dde-darwin-amd64"
      sha256 "6503702dbe704bc76363b24d33ef6921928d0f2eacbc6f1f85e3ceeb286e10c6"
    end
  end

  on_linux do
    on_arm do
      url "https://packages-test.dde.sh/homebrew/2/dde-linux-arm64"
      sha256 "c88e037d53bcae39d6a0bce3efd7a31025e9a8eacda1595a0db77239c43156bc"
    end
    on_intel do
      url "https://packages-test.dde.sh/homebrew/2/dde-linux-amd64"
      sha256 "8deab9511c9fc86cca1960749621ab21af7c58471acc0596523786bba31cb60b"
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
