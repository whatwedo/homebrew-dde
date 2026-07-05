class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260705.2254"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260705.2254/dde-darwin-arm64"
      sha256 "f5fb2d71bded2eb441208e29359b8af756b61507565219d9c92ab3d967cfb017"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260705.2254/dde-darwin-amd64"
      sha256 "be3e198a677ff89a861b367e99ca5176f700a7b5f3bf3434546948fc85966644"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260705.2254/dde-linux-arm64"
      sha256 "ec71ad7fd78abaa101a0dd7c234379dc77fcc66a099dea3e657ddcf6036c7d55"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260705.2254/dde-linux-amd64"
      sha256 "3b14dbdfcbe517325608cc7c22df5c72000de71926e4f5f345e705181dba9af0"
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
