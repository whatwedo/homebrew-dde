class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260601.1846"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260601.1846/dde-darwin-arm64"
      sha256 "51db8e1881afa795ec0fae263ff365626a23600010922301d3676603a9209ac3"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260601.1846/dde-darwin-amd64"
      sha256 "eb5e364f2a39b4eff0330415b0ad04f212b4ad7e7b9a2859cef94a9e4a11dd8a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260601.1846/dde-linux-arm64"
      sha256 "c383af40284a5b5bf353fe4eb3871d0a6fc4f31eb78829096d37b1985627067a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260601.1846/dde-linux-amd64"
      sha256 "165d643ab698c1d33192808daa85cc2f14446ef7cb110896db7ac27836e1b964"
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
