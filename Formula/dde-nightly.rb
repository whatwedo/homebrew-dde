class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260619.1127"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260619.1127/dde-darwin-arm64"
      sha256 "69b03212291f80b996371b8ebbeba8c4a49f7d80c430bf30f74be2098c608e02"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260619.1127/dde-darwin-amd64"
      sha256 "6752a295f7d19c9e6bba467262c364df456f5451a04b4352247f6166c2795229"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260619.1127/dde-linux-arm64"
      sha256 "613a549c79bd02a76a689ec35f18a3c2b516e62575e41bdf6e7836b4578cb292"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260619.1127/dde-linux-amd64"
      sha256 "821ed7854bd0082e0215bf4f0a577cead427158222e71ba215a160f63c508af3"
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
