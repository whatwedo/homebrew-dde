class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261115.0116"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261115.0116/dde-darwin-arm64"
      sha256 "6adf86f4fc4d5d7c87633ef1859b3df654fcfd700dfd2fededd3156e7d6b35bb"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261115.0116/dde-darwin-amd64"
      sha256 "659c76a5ac3f146fbcbfea74341f9dae944bffacad7ec3a55dffd8b4081a4565"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261115.0116/dde-linux-arm64"
      sha256 "6e201b8646bbb96087f5ffc44488cf15ed1589e0e54c4e29ec0a472bf467104a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261115.0116/dde-linux-amd64"
      sha256 "60f9d9284ae2033a1b53ae7c7ab707727bad7bb357940e6d814c1a912c41d47c"
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
