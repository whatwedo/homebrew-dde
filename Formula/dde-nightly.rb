class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260723.0915"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.0915/dde-darwin-arm64"
      sha256 "d7473ca9e20ac3b481da502cae14d3d83201b5530ac69d8504604aa3778b2834"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.0915/dde-darwin-amd64"
      sha256 "86ac38e371493ef8b9ffd28466a50d539f0f075534d2320f2dd2cfc86b45d614"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.0915/dde-linux-arm64"
      sha256 "407a4ca33fd8d66af0ec10890fd8ad7ed175935d3641a7d7cb30579ac05a2e99"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.0915/dde-linux-amd64"
      sha256 "dbc733a7e3fe75991bcc9440b4077234dca8f6643809c1dfdc1ae501d7f2e306"
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
