class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260721.0055"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260721.0055/dde-darwin-arm64"
      sha256 "643c3c53a321b08164a4fe8072c31f7b094b40fea60c08298f97c47919850c2e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260721.0055/dde-darwin-amd64"
      sha256 "f562f03e22263ad6bc44df9a0b666ca3a7fb44dc1e068ef720bed69e67e315c8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260721.0055/dde-linux-arm64"
      sha256 "fe14af8a56b4f9fe99335453daf7f15824f24638fbdacb4412da2acdbddec5f5"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260721.0055/dde-linux-amd64"
      sha256 "6f9d8abee8b76348d78aeabf45cade6a5af506eba66b701635d871eedf6a5557"
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
