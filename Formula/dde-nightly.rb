class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260906.0148"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260906.0148/dde-darwin-arm64"
      sha256 "c789b6b6ea19433e9acf4e6716833fe143942e522c2bee1ce76f672219991214"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260906.0148/dde-darwin-amd64"
      sha256 "60ade91651180c7779b6b192265c4e234cf4d5dad1b2cff428694aef3e9e97f4"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260906.0148/dde-linux-arm64"
      sha256 "3f8795f4e29cd4bdbcc2f74469e0dd1c6566a116d63466b5c236ebecbe646087"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260906.0148/dde-linux-amd64"
      sha256 "d5cb150d4fd1a5c042e838e7ff2a08925506aa90395e84f19997ca85132faf3c"
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
