class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261016.0904"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261016.0904/dde-darwin-arm64"
      sha256 "897cf67f13bdb5b31e98d0a72da6614ff72fc5b811c38a05286c3878dce452f3"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261016.0904/dde-darwin-amd64"
      sha256 "3197f63195ffc2bf1200c8ff560290bb7f3fa8e26d62aa6e0b944a8c962a5229"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261016.0904/dde-linux-arm64"
      sha256 "c13288580f0a52eeabba557a45b19c56f5fb54518ddb0870fe8002f20e8df7b2"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261016.0904/dde-linux-amd64"
      sha256 "46e230e8f31c7b6ba3591c83a733274274b354de7aa75d1f50dc7f4e77816cf8"
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
