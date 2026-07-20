class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260720.0843"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260720.0843/dde-darwin-arm64"
      sha256 "bf13ad5dc96357ec639e39447fb4e1164dde3f15fafb2749b024dc44ec0b66aa"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260720.0843/dde-darwin-amd64"
      sha256 "6fda4e54d22767e82524e6a3a6257e12bb1c38fe22a2551a930363588e56a2be"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260720.0843/dde-linux-arm64"
      sha256 "21fbccf761f5d0810d5d666e75023df4fc6b791ac859e9b43c2914742007ae41"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260720.0843/dde-linux-amd64"
      sha256 "c861d3386ef3ce8c22fba958eb49a8d6d4657eb4564e4a74d6b2e2d350ae360b"
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
