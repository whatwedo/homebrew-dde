class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261101.0444"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261101.0444/dde-darwin-arm64"
      sha256 "0bbddda4420c024a6a7f4098f80a0f0b75744b970331a3d3096986eb347e54e1"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261101.0444/dde-darwin-amd64"
      sha256 "96d9028b3e861b36deff45468f42dbc29ba0b0b7397b7f03e55bd94bebc33c14"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261101.0444/dde-linux-arm64"
      sha256 "51770ab681a74c8d945b596af5244b7755612c373dd90227ba19d8147ba510de"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261101.0444/dde-linux-amd64"
      sha256 "0fe319cdb8d1fbf8dac9bb4ff326771bd05505f0d2485430147994d7c3bfbb4c"
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
