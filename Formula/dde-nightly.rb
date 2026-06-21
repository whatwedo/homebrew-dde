class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260621.2059"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2059/dde-darwin-arm64"
      sha256 "a291c26ffd5bd42205d79317130ff5e4cdeca1dc3256fc7edf7cf9b4f9c8e311"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2059/dde-darwin-amd64"
      sha256 "93417d2d4603b333ea872fcb36bc0ca7796ede573f227c974977dcd95c24683a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2059/dde-linux-arm64"
      sha256 "b482e85c0c1be6e154f96ec70d747d9ca584ee0f8b77b827a9404399ccc75d84"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2059/dde-linux-amd64"
      sha256 "8193fbfd0b2b5ecc13257709098e49ca007b88ae2ad77547b87305162a8864ee"
    end
  end

  def install
    bin.install Dir["*"].first => "dde"
  end

  def caveats
    <<~EOS
      After installing dde-nightly for the first time, run:
        dde system:install

      After upgrading dde-nightly, run:
        dde system:update
    EOS
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
