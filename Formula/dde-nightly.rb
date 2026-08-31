class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260831.1815"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260831.1815/dde-darwin-arm64"
      sha256 "d573f12406ce625b3046be95a75df83f81bffcd748585b50d91e68ef8926d59f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260831.1815/dde-darwin-amd64"
      sha256 "b030203d9f04ce04284f6e8a664808bbfb252c558ee5a0c62e44ad856ab3416c"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260831.1815/dde-linux-arm64"
      sha256 "2ed80981defc0ff341ae4549a0fafb8beecab267a4775920223ef49ab21fabb2"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260831.1815/dde-linux-amd64"
      sha256 "0b7dc37d83de89d58fe97da496b12d0761f4d623ba5bb042a8a95a8683ea84bc"
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
