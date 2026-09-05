class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260905.0026"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260905.0026/dde-darwin-arm64"
      sha256 "6fb9a3266e5126d98ee5ae5471566ca729f65b9864c8c54da672f497f32f6909"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260905.0026/dde-darwin-amd64"
      sha256 "e98928d03ac2ec6b348b20f718f183f31e54cda6972807a9f0bbc2e1da0dc981"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260905.0026/dde-linux-arm64"
      sha256 "878fe0de2d75ab6b38445960ec401c2cb52170b49448007fa248c57e33262f1a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260905.0026/dde-linux-amd64"
      sha256 "1c84dde79db232054ba2a1b4b17a6616f10c59b6dc2885bc2f7d1d72ecc98e94"
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
