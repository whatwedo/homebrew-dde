class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260724.0655"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0655/dde-darwin-arm64"
      sha256 "7e7488d9297686ce07a312b462cd5a751d09b86a22833823b1f61a6f65066417"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0655/dde-darwin-amd64"
      sha256 "5f194c1b042e51eaad8dce77ae182ee7b4568bb32e5a206e5b7b210a778e7db4"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0655/dde-linux-arm64"
      sha256 "3f30527a751a2c379981b503a8a5ca382249574d41570dfedcf079a7bba63f01"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0655/dde-linux-amd64"
      sha256 "0b278ac66902e48cc940af7ae4fa6a3aac026d5f2ff3a56edbc5791208e666d2"
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
