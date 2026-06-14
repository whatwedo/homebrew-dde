class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260614.1813"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260614.1813/dde-darwin-arm64"
      sha256 "91fcc43779b74057192e564b2913215f944f594573887b6ba848c342b0f71c83"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260614.1813/dde-darwin-amd64"
      sha256 "4dca6602cac6d1af3cb7796205a76798fded0fd2c1382861b8851433098f6822"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260614.1813/dde-linux-arm64"
      sha256 "b59374d5cbbf8c973c405dc55b798f6f490bf98099093d843fefaa106f521d54"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260614.1813/dde-linux-amd64"
      sha256 "84049b1bb8eb25be7fcc85f5c2dbb78a1b36c74093cf11980a11003341699b60"
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
