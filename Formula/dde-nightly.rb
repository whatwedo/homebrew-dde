class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260724.0835"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0835/dde-darwin-arm64"
      sha256 "9097c2b73a4a098e89542097e107bdc4033067a11eb5df6fb7ab1a5ebdedddf8"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0835/dde-darwin-amd64"
      sha256 "3289eac2edd2efff5ff1e90cf2026c2c74daa422d6492f549342ed4ed532b803"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0835/dde-linux-arm64"
      sha256 "f9e093b831463d3427ca14d48a5d06bdde09a529f61cd157c002d58ca0cdf692"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.0835/dde-linux-amd64"
      sha256 "ebb4cd06a9187ff07163192e505ac10ca0c5f8cb89a61ea690ba824368da4bd3"
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
