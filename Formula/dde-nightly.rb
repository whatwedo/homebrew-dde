class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260705.1338"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260705.1338/dde-darwin-arm64"
      sha256 "d7acb595bc5eff926ab393093ed82f5132c626d6417443336874ea47b7311655"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260705.1338/dde-darwin-amd64"
      sha256 "0cd25916fd9563875ece509b367acc81265318106f001e66598606505817afd7"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260705.1338/dde-linux-arm64"
      sha256 "d5fe7cc5be8d671d5c2f140aed2c9ff078358a9a3aeb25f819f01c8ec67da50f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260705.1338/dde-linux-amd64"
      sha256 "2796996116e036dd687f8094fc8aae575d7836473aaf855c913a94b02baf7f01"
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
