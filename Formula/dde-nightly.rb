class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261024.1633"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261024.1633/dde-darwin-arm64"
      sha256 "6291ce3242e9f11ef45920c5d07a9d53912f8d3b51a23e25703dbc71cd261c18"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261024.1633/dde-darwin-amd64"
      sha256 "8bba93d0be094426a42cbbdba5e60017abf912d9e618c66bbd0023fbf8c4af20"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261024.1633/dde-linux-arm64"
      sha256 "a6c671b680e598a63bd3520a9ddf0eaef04af9ab7c8866a2578ee9c7274b6ec7"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261024.1633/dde-linux-amd64"
      sha256 "4b4c4c6be084d172f278e5f4ebe0ca6b63869d3e66b4d15211a42b31e3a6a941"
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
