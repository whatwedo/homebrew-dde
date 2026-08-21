class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260821.1909"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1909/dde-darwin-arm64"
      sha256 "4ef97fd8f45a974a8b653f92ecf94a5e3d0b73b50ef3931f5f2d55e46da1beb1"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1909/dde-darwin-amd64"
      sha256 "7ad5372426d7a4940bdaaf3acee50dee548f08244a52d312e5ddbe695a34ec80"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1909/dde-linux-arm64"
      sha256 "095d4781b667c6266f29cf342bb4e782cb2314135d3eb7e432861cd2d7bb171a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260821.1909/dde-linux-amd64"
      sha256 "04be7de9fd21ee26bf8fdb62ce3ef1cad30191feaa1ee4204f07f3e83449733b"
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
