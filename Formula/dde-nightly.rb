class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260718.0902"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.0902/dde-darwin-arm64"
      sha256 "98decbd3ea414c02fdae475b4050d1e547b1703634c12d8e7e7c744de7d7b516"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.0902/dde-darwin-amd64"
      sha256 "e7cc3c82a2c35b573d60978beb7cb31cea75d2243b1f2915d3348be9927ceb71"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.0902/dde-linux-arm64"
      sha256 "15931e8e411d7982365e7d76f9df464a2d0bf2a2b9f1601b24e35fce929243b4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.0902/dde-linux-amd64"
      sha256 "b52a1c35f2a3e63c88d4231abed1778b58da9a7b3121a06b094ffa56b285ce2b"
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
