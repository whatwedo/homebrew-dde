class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261107.2031"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261107.2031/dde-darwin-arm64"
      sha256 "02984afde3621dc55fd2e380c608de5be012c020cd5e63431adfd3bd9b5f726a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261107.2031/dde-darwin-amd64"
      sha256 "2383a1c0d11516287163566d7cc21f97b13448e3ac14d79988ac1f1145451194"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261107.2031/dde-linux-arm64"
      sha256 "ec4937e8f7a8781b531ef4bc739ce37c62142b46f33255ad6df93c5fff26740a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261107.2031/dde-linux-amd64"
      sha256 "9f78f1cc6f747ad244bf63df3ff9f1ad2eb85f9542f4313c07c492e029f57752"
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
