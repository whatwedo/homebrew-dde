class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260623.1501"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260623.1501/dde-darwin-arm64"
      sha256 "b46da9420924cada0cbaf09c182b803201ca236428ea2b48232a9991e5ea8f6f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260623.1501/dde-darwin-amd64"
      sha256 "87166546278635204a1f81d06e35003dd0ce83a30adef1c11b49bfbbc905b3d2"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260623.1501/dde-linux-arm64"
      sha256 "dac804f0b8b66b1677976c069efc54470eb0134c8f3d53d018e88368807d8aac"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260623.1501/dde-linux-amd64"
      sha256 "c773d3f82b47da8bec60bf0720fa0c9b34da1bfdcbb047ed182089b6afdf630b"
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
