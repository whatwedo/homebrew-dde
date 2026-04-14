class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-alpha.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-darwin-arm64"
      sha256 "d92e35ad25293b0001e0a2d0e74b42ce3a6bbe3a45c6fc2c5b9f3626ed2ccaea"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-darwin-amd64"
      sha256 "973ac3321a90ee405aa02c689e22d6d60e79e6e7817e7e469659f118a0e9e792"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-linux-arm64"
      sha256 "fda3b19f5a5fe4528a7c0eeaf66222e616878d09e9fdd5791b0abd0a2ff05d96"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-linux-amd64"
      sha256 "5a516c1dc7319861ea8d5416cd67e02bfa8da1132c02d762c65c0b35af42d62d"
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
