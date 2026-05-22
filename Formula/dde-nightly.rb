class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260522.1138"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260522.1138/dde-darwin-arm64"
      sha256 "e9884f030d81aa666b401ca30a1801e5dff77d8bde09ad7faec8417f992f7fab"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260522.1138/dde-darwin-amd64"
      sha256 "5d5a27272338ae6876e84faa62fba480c3aa2dbbc829d59f953dfa95474d6a18"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260522.1138/dde-linux-arm64"
      sha256 "759a315161ee98b2da1f8d6f085dbb30f4ca25be2c8f90c4e72b5e99c1b95848"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260522.1138/dde-linux-amd64"
      sha256 "4a8e4994db7558c09847a71ce6515ae26dde2928780d22239f215b7d4e99e13e"
    end
  end

  def install
    bin.install Dir["dde-*"].first => "dde"
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
