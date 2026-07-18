class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260718.1814"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1814/dde-darwin-arm64"
      sha256 "7e686ab2c0edbdd3d35dbf78aa5adb27a9536120a047318d817ceeb6fa08177f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1814/dde-darwin-amd64"
      sha256 "a584383e2f68c3cd80caec80be92b21887289094270de4c91310b7385d6befe4"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1814/dde-linux-arm64"
      sha256 "1885da2ba5ef6cf3b5caee5b8def8cbef45a8fb4fc789c27af1904298c4104e4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1814/dde-linux-amd64"
      sha256 "2e29cb040a20f9d2ad419768afeb7dba3e08b5f9fb0976cd460e9d2b41c422bf"
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
