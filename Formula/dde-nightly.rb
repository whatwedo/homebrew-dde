class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260807.1441"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1441/dde-darwin-arm64"
      sha256 "50fd52ab20e97ed7e78f4762b55f4d01d7508c1f5b1c2c2bf096d01604d0ed9b"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1441/dde-darwin-amd64"
      sha256 "6146ca065a6f447a31274ab9b0c1f5f8d6bcc6d26121b671460d6f196c316c14"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1441/dde-linux-arm64"
      sha256 "5485ca314bec819a22f1ae3146037a813feda3dd6492580eb6ac8954fcc120af"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260807.1441/dde-linux-amd64"
      sha256 "e328390c315ff8bbf6adf1727e7a286124754c7fb2504ec06a27b6d4fef7a107"
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
