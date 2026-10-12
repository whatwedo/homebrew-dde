class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261012.1913"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1913/dde-darwin-arm64"
      sha256 "3c23484e713a7cf08cb44628c9804f4c820b378f4363277104cdc9d71cff189f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1913/dde-darwin-amd64"
      sha256 "e4c918eaf97bd58a204ee8d91b6215cf01673e8769e6d0ea7487a5b3daba51f8"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1913/dde-linux-arm64"
      sha256 "5259c84ad6b048ae2e504d15515928df73fda62308ea1ad34cd7ad4beb1a2fd4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1913/dde-linux-amd64"
      sha256 "51c43a7806be90e9c93edcb7ced0dfd500e96bf9767792e74e7c0f114d9ffb5f"
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
