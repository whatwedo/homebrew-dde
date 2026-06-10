class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260610.2210"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260610.2210/dde-darwin-arm64"
      sha256 "b2514aedd327792a10164ae7c3bb98e36fac3e8fab8fb3385ab0a3add32c0720"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260610.2210/dde-darwin-amd64"
      sha256 "77e4861d6913c78a32d9a71c2d089f6253c6ca3faf563333d6d46b527641d9bf"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260610.2210/dde-linux-arm64"
      sha256 "6bf5f7a52824187e1367274eaae84e8a39bec4bc201036b54b7e42ddab99c4dc"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260610.2210/dde-linux-amd64"
      sha256 "370d5b84a088a182e135d7ac52b69cc3c67362ee2531ed52cdc361c5da802703"
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
