class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260614.0505"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260614.0505/dde-darwin-arm64"
      sha256 "517206b47bfb4d73738fdeb2b4a792834e1ad843f775ad21d1af1f691e8f45b5"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260614.0505/dde-darwin-amd64"
      sha256 "42239d73b1880fca9d612b470be2eefbdc005a11cd6ab55c075d88abf5252040"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260614.0505/dde-linux-arm64"
      sha256 "a43b3c9279c8e8c46a64f1d2c9995dc97662d61e25014ca11ba6619cd30dab73"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260614.0505/dde-linux-amd64"
      sha256 "fcc9ab3dc9865192a4260e6601620e1c3a465296b96c7ba96d2277de262840a2"
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
