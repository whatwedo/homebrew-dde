class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260625.1944"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260625.1944/dde-darwin-arm64"
      sha256 "349775465e483987c7157b2779dc89ff7f268344d155ebd68af438b65e81165b"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260625.1944/dde-darwin-amd64"
      sha256 "87efb277715e45c4ee9b5074a972883b59b7e73e503444463a1b843c71cb426a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260625.1944/dde-linux-arm64"
      sha256 "d97f74fab46c515032dbe492ea9f98def1f64cd2804d869dc6ddc831bfd9fa0a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260625.1944/dde-linux-amd64"
      sha256 "38b92ae5ab99e28d206173980dd0032bb630f51151bedb5d16249e4dd06e6012"
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
