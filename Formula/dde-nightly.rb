class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260717.2243"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260717.2243/dde-darwin-arm64"
      sha256 "0eceb799b1885a0e058878aa1f712eb9fcce38cbf594d3a476cee87af0014c05"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260717.2243/dde-darwin-amd64"
      sha256 "f2b71338acdf77cd991be838647c0111081df6f9c84a2841aea8020c5f432783"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260717.2243/dde-linux-arm64"
      sha256 "7fc56a5ac5d8e3bc65b7559648d62b826055f9c82008a1ad82705afdf6783974"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260717.2243/dde-linux-amd64"
      sha256 "e548cfe3dcb990061c780fa48bd7850ee0990405e7a5b345849e634b35634a15"
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
