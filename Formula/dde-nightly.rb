class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260821.1838"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1838/dde-darwin-arm64"
      sha256 "bba4e46ffe61d56b49b58ebd35415f525c375b329ab6762335bebc10890394cc"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1838/dde-darwin-amd64"
      sha256 "ca5f8dd2f5936df1b40091d27a675a60be6f1bec09b2b437ef4c5594c8cb5413"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1838/dde-linux-arm64"
      sha256 "3c3bf757198d531d650ebf87e1cd3f59b0c18b54a02a5e517dbd1571a76e1478"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1838/dde-linux-amd64"
      sha256 "098887174b51354d1a14419cf72c9fa44806f75594526343b4b3a502ae3b0f2c"
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
