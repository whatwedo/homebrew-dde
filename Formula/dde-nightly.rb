class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260906.1331"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260906.1331/dde-darwin-arm64"
      sha256 "54881d9fb1edb9bf9f558081397eec59cd52b4f7fd7d00d868faaf297d3f83d6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260906.1331/dde-darwin-amd64"
      sha256 "f1b1cb115f565dc8bb8ffdb1f848268484b66a0520603475e8d5eb3f1c120fbd"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260906.1331/dde-linux-arm64"
      sha256 "4840d29ae8eddbe0d6a76db4f11aeddd949eb7b65fc263ab18e0a2d904c9f7f7"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260906.1331/dde-linux-amd64"
      sha256 "dccb4828ae4f6857120f1570efd7e1aecc32007627b2a5ce35874f53c3cbcf43"
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
