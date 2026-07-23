class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260723.2023"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.2023/dde-darwin-arm64"
      sha256 "641331586c6b9de57bd6edb8f531a36201c3e8cc61d16a3fa8887fdc61f78042"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.2023/dde-darwin-amd64"
      sha256 "e0288ad643c5c4193a1b8ed0735f40032ce8d44cceb0841c2b78f24625381ab2"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.2023/dde-linux-arm64"
      sha256 "f1395f956f0b49fe2d209519a106f4aafacfa5e90406adaca008d648afe6e280"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.2023/dde-linux-amd64"
      sha256 "b936aa6e94881c6659cc759ff892db4d5d5da86a70465f6b09ed97c410c27a7b"
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
