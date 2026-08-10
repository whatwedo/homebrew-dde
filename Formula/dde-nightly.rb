class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260810.0756"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260810.0756/dde-darwin-arm64"
      sha256 "eef39beaac503910639e60680cef46a4ac3724636194d9a35d65374c9e285b84"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260810.0756/dde-darwin-amd64"
      sha256 "9a1711801d1b69896076238a38679a183ca263e8bd4fd0c30bf98856051f8bde"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260810.0756/dde-linux-arm64"
      sha256 "c1b5c34ffe794cb8b27dbb2c180883bb0d037a8e354189d736d68e887e044913"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260810.0756/dde-linux-amd64"
      sha256 "199273597d6fa37d824cb47e94fde9a9b06c954382b5e4ed51080fc9de6998a3"
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
