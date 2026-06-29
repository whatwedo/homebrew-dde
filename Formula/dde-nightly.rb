class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260629.1939"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260629.1939/dde-darwin-arm64"
      sha256 "1d7c833d91d5d20f29fb253bf394a80571426f3f7ed3e8dd64f112c32b932ad9"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260629.1939/dde-darwin-amd64"
      sha256 "e5f7b5a87162c421cb6e2fe13fcbd12744b93b6e9508e15e5e44dcf5a26939f6"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260629.1939/dde-linux-arm64"
      sha256 "db5a3b9e108786770cf690ba2b5122d389b390b87fe4e46c05edadcf0613e860"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260629.1939/dde-linux-amd64"
      sha256 "f59720752b87785ac495052b55679be4043ce8aa63bd9acf18425e2839cb453a"
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
