class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260807.1314"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1314/dde-darwin-arm64"
      sha256 "260c14e8d20ef6c10f2662a8bc754630c16e9dec419a44b672f1980b8dd16278"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1314/dde-darwin-amd64"
      sha256 "192b3569cef49bc9dedc351c5a338fa3b6b92efc63c8bd927f99a0bc4608cfe8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1314/dde-linux-arm64"
      sha256 "aae2cf3d6b6560cca7b30e7e58fea998d4ea85521aa2cdf79bf63309b4976904"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1314/dde-linux-amd64"
      sha256 "8f71d299edac2ccb1c7f3ddce6f3efe297c66b8cd6c25138de139a13209518c7"
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
