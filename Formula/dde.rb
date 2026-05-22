class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-beta.1"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-beta.1/dde-darwin-arm64"
      sha256 "7a3657ca906bbfb2f89bfb6191b84489c4a33e33a7eab12611f6caf027bd9440"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-beta.1/dde-darwin-amd64"
      sha256 "64b3369f86502228d6e4f480d5fd54c309dc8b940217fc0c0c0ec507f52708d5"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-beta.1/dde-linux-arm64"
      sha256 "4838cff0145d2ee9ea7e15a08549d18a951035aed272383f86935baec9a27069"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-beta.1/dde-linux-amd64"
      sha256 "62378f5545ab401bc3eca7939026463e52b43eaf6de1bf597d1827bfd0cf2048"
    end
  end

  def install
    bin.install Dir["dde-*"].first => "dde"
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
