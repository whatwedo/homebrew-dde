class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261030.2142"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261030.2142/dde-darwin-arm64"
      sha256 "fae788c1761377e6ce700a4a7fd2f2e7639dcf06212f563acb50ec7a632b0deb"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261030.2142/dde-darwin-amd64"
      sha256 "38cfd0570977d6c4a2515a27b68411b4aa864f7b3c51b25711bede8f11375ad0"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261030.2142/dde-linux-arm64"
      sha256 "ff93308a27fb4036b0169dba2f9ad1e7f34422ba7eb6fa7cfe74c29170258265"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261030.2142/dde-linux-amd64"
      sha256 "713b635540e0701b9b9768d726bacfeba6c52817b204b82ef5270e90d9671d55"
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
