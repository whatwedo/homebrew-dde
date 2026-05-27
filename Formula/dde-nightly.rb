class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260527.2136"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260527.2136/dde-darwin-arm64"
      sha256 "fb2476ad2c46da56157c27d832caa485f4ec524144ba7a6700f33be6fc844186"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260527.2136/dde-darwin-amd64"
      sha256 "6c2e9bfc0c79643a0639cf8039a08ec7f9dcb02715d10bc600d9e66d8825c163"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260527.2136/dde-linux-arm64"
      sha256 "1cf747cac1f506c12c0115453d06b7e315150d031d73b2c19850e6441cf3f0d6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260527.2136/dde-linux-amd64"
      sha256 "374b84569d37bf553d5d52da6c3ae5c010abb63bb5cf2156cffab1460f529495"
    end
  end

  def install
    bin.install Dir["dde-*"].first => "dde"
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
