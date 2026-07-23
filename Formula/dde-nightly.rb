class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260723.1022"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1022/dde-darwin-arm64"
      sha256 "9f73e67bb49b2d8d11bb9659496a1107b50ad9bed6272336867fe42e617cba39"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1022/dde-darwin-amd64"
      sha256 "049266fcd6b94ee1fedb4a3c2710bf351b5ef50e92583f35d22fdb5fab9711dc"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1022/dde-linux-arm64"
      sha256 "86c87a6b823264b798f463bb138701f3898a8bd12ba41edca14def9c32030ad8"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1022/dde-linux-amd64"
      sha256 "aa25af33506db0ed0ab9d094d8a872010a4090f0d8787954900466a70700babe"
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
