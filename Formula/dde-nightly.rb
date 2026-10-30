class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261030.1238"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261030.1238/dde-darwin-arm64"
      sha256 "41fd2a894c20c3646bfe050d6ab49fbc1a48056833bb8a5fa90976c2ee056c64"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261030.1238/dde-darwin-amd64"
      sha256 "9b85fd844bba6d688e24418b122c60dcc638cd9f8585b1b9266d050cc42a6568"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261030.1238/dde-linux-arm64"
      sha256 "9fd4946738214ff0c28f7dbe8b642bb84d7532bd4276f3f2029c72fc8d05f49a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261030.1238/dde-linux-amd64"
      sha256 "880c443db6f9d1565bcc7d914e7f5258805d50ed4c0e5d6134f5f5965953df15"
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
