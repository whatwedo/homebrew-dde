class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260728.2108"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260728.2108/dde-darwin-arm64"
      sha256 "40dccad245ee2bae66bfad7f281a06fb50ac35cfd8696c0305803151736e0602"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260728.2108/dde-darwin-amd64"
      sha256 "1d8ba42b6aedeffe1f69b0a263792de9dad84643e05096e7fdd5978e44d31d96"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260728.2108/dde-linux-arm64"
      sha256 "02ccfe809ea369be117fc15a458160c1d9ebc23c1b5d45ce3a9dd843c140625f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260728.2108/dde-linux-amd64"
      sha256 "0f1a87fcc9366b34e6a800576a51a68416d0268fa803f0bd66ee93a0fe2b0d78"
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
