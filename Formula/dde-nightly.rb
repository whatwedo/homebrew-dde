class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260727.0946"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260727.0946/dde-darwin-arm64"
      sha256 "3b439e951ef361805441ef3f2fd316513bb40d5e778e31d5fbddecc25bf9751f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260727.0946/dde-darwin-amd64"
      sha256 "52fb3426014fee9cfafde90906e762f7b3dec45f67bdcad52b05d14079c79516"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260727.0946/dde-linux-arm64"
      sha256 "df011190097069f0b7a0882ddfee9943db40461a6e188c893a4482ba7a0e9dcf"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260727.0946/dde-linux-amd64"
      sha256 "886eb7d0516d4c3b51467f767069fbafa3aabe2005f011194211117f598a0d47"
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
