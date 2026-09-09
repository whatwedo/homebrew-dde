class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260909.1935"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260909.1935/dde-darwin-arm64"
      sha256 "ac029ed047ee3eed8d1eea130bc3d57ee46cb54996eee51a4edc2b730761da77"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260909.1935/dde-darwin-amd64"
      sha256 "dfc90edd71d1133262d467d27606b619199a75dd82c81eb6905bf4d8f09f9b88"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260909.1935/dde-linux-arm64"
      sha256 "7e2365abba36cbf815887304a4a61ced5eae7a974ed85ac90e24a98316f7996a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260909.1935/dde-linux-amd64"
      sha256 "9732d951a8c733fe674b136f25e642e0aacf017806043c3ac6192b14cbb252c7"
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
