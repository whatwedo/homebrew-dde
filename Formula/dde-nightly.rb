class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261125.2240"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2240/dde-darwin-arm64"
      sha256 "6ef2c0e6173d09ae10cc817c48a5c9886faed73f001c9f5f6685094eb528d448"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2240/dde-darwin-amd64"
      sha256 "d2cf710e117f7813b0d75a27d9519304adf7a784496dffa22960354ebcd51102"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2240/dde-linux-arm64"
      sha256 "a4ed10c5e9da19b90d3e062559fef37bcaf2053ffbcd545815ac7b40166edd00"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261125.2240/dde-linux-amd64"
      sha256 "89e6e724932c04eaf248530600260a3665b74e580ef1753793c2baeedccaf38f"
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
