class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260807.1143"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1143/dde-darwin-arm64"
      sha256 "201afb88fadd3a1600d23269df7296a3c2e091d0c262ff695c46de7c92880d7e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1143/dde-darwin-amd64"
      sha256 "c71caeee8b3ee7d6873e066bedaaaf418301af6276e576436f104f53f93924b8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1143/dde-linux-arm64"
      sha256 "88b283cb18ad5cd0967b0118a56efa94f1dc7549d2fd6a6e2987d5cf5af36b2e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1143/dde-linux-amd64"
      sha256 "05af5be970ee900f491f56d89d7615cea9ade1d96b27229ca29ee9afb2be5fbc"
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
