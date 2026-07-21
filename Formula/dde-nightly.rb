class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260721.1125"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260721.1125/dde-darwin-arm64"
      sha256 "0bafc4c16b65323b2a97a5664d5975ca65565f125c32650463c1ccadcaa4bc95"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260721.1125/dde-darwin-amd64"
      sha256 "c6cf050f66d722ba2a8fd228a282cf9c24534de1541e0ade0de82af3b551aca7"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260721.1125/dde-linux-arm64"
      sha256 "73541c493e8443beee0ec72622e14219b0adc8d3f48cc4ea29e1cde59b63f4dc"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260721.1125/dde-linux-amd64"
      sha256 "3945b22c7f7abd03cabd29bd320654842ff0acbc4df3768be0a74e4583f0c831"
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
