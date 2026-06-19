class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260619.1132"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260619.1132/dde-darwin-arm64"
      sha256 "2675418f0871790a0077d76fda1725821e30f182f74aaa40e8dd49724ce65fc4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260619.1132/dde-darwin-amd64"
      sha256 "961ace5448a1854db38c8e33b5806c0b6d43ce236864df4e5a11cdb5edddf15c"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260619.1132/dde-linux-arm64"
      sha256 "a29205efb6021970073e052c0d07541c198a942379de25906a490669fa22d4c1"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260619.1132/dde-linux-amd64"
      sha256 "ad34fbd0758567c1cc7cd0035e4677a78e237870bcce631b477fd34b93160750"
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
