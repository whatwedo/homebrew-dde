class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260830.1727"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260830.1727/dde-darwin-arm64"
      sha256 "1d94db26388f0b2c66c4416a0613cf06e09e6a9e16c42295a30302b5734b4fab"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260830.1727/dde-darwin-amd64"
      sha256 "7eb8598177effe5ce4d63991cb019ea9e76915cc358cab7516ae92e131ddbaa8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260830.1727/dde-linux-arm64"
      sha256 "1157f2a434aa72fa324d7a81d888d1d75f486205682c3b7fe02e55a6eea15de8"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260830.1727/dde-linux-amd64"
      sha256 "4615343b1f1f216fd4f69fd1bdc29802dafb3a16745987f8cf6c56fe69fe4947"
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
