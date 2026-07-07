class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260707.2208"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260707.2208/dde-darwin-arm64"
      sha256 "b6b2b2fbefae2a7dd4d3edc3fb6aa8098bb1ea2867a17f222a7821e7b2ad1e15"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260707.2208/dde-darwin-amd64"
      sha256 "0050ce3b51cabbb159da4ea695b7944812d633cb6931f44484b59b7bf2e75d7c"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260707.2208/dde-linux-arm64"
      sha256 "d6c1d1d8d26632c96b0b75de05d76147b424839c2cf0c4bf3df5e562804b1736"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260707.2208/dde-linux-amd64"
      sha256 "b34464f72dbfc1fa9b2294b26a2545f85536249dac8af46ce9d618443cc6a878"
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
