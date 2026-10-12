class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261012.1909"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1909/dde-darwin-arm64"
      sha256 "490f1d416847d6118ff8d62a044fd17a77e2eacdc80f2c38801cad953720eaa9"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1909/dde-darwin-amd64"
      sha256 "ecd3c10b4ceddf3aaa49fff7be261387cf60378f7f2a03529bc890744cf2b14f"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1909/dde-linux-arm64"
      sha256 "34b0c3719f9a331c7924fbbef066156468e16fc88d6925b801b062d4b8f575b4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1909/dde-linux-amd64"
      sha256 "b71d30d87c101237100f96b8879bae8560fe81729250e16fe968aabed4e284e8"
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
