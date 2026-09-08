class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260908.0347"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260908.0347/dde-darwin-arm64"
      sha256 "62e17846038422cfeb0943ee796b0f05094bcdd7072a127fce9b3499de54b128"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260908.0347/dde-darwin-amd64"
      sha256 "6ee434ce8f0b6dee1a6cdff654a979b9ed9313def0384216db7b9afc1298334b"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260908.0347/dde-linux-arm64"
      sha256 "f3259ca25ecd68c5462e2f34d42173e714c5845564859d414176eae8fc80b785"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260908.0347/dde-linux-amd64"
      sha256 "6091dd571288a6d17eae9e256e4792b7af180673547356027b1d30f9e6f9c4fe"
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
