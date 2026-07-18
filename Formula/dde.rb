class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-rc.1"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.1/dde-darwin-arm64"
      sha256 "f23fad200d41da9eaae74358d8608b31586229f0734d1168db36ef7c05bb07a6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.1/dde-darwin-amd64"
      sha256 "905918e2defc57af5a029ce290b36c68aa83c38c7a3ab553147588a2f522f5f4"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.1/dde-linux-arm64"
      sha256 "8e3cea6d9ef844c0804349d84bf81a2f4e9f121a2e48cd7b3c86b03925693e38"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-rc.1/dde-linux-amd64"
      sha256 "7fb0dc8551928c117e77a8d7dfbf3b64f13db693b8352c78fda48331cb23cc15"
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
