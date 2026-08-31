class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260831.2254"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260831.2254/dde-darwin-arm64"
      sha256 "4bcd8ab676ebe508236ac8c9a32e43af1c11e3522c960747b2aa33a84d6fdab6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260831.2254/dde-darwin-amd64"
      sha256 "bea5e9a0affaa8a73861fdb6112f15425fc7131ede7812d04f9369ce97898444"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260831.2254/dde-linux-arm64"
      sha256 "eeb9f269840fcff99382e59dc601b58c6be9a12e6f2945b311ecdc6905618e2f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260831.2254/dde-linux-amd64"
      sha256 "4a5b9ece35004c7f85fb1cb3bd918db65653c7a8122be817b46dfb5b780b6f63"
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
