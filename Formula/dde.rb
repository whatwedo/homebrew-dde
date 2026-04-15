class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-alpha.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.2/dde-darwin-arm64"
      sha256 "082d336c42c1d010bf4d5b6e2aa4da9218463e1c161f3e60a91ce2482be70041"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.2/dde-darwin-amd64"
      sha256 "4b34a832df5bec80193857b71102b25455e88e6e24de2831b2d383c3eec7fffc"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.2/dde-linux-arm64"
      sha256 "b7e2a3235ba0dbb4b25ff60dcbf3a54056aebfd838e8b4ab04418601e802a921"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.2/dde-linux-amd64"
      sha256 "e5cae55df0ac4417c26efd2ab68da1be7883ca10e5d41ad6a45a6b93cd285e8a"
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
