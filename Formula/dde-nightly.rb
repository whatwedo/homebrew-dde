class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260723.2003"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.2003/dde-darwin-arm64"
      sha256 "c692c79b4bef84c01660f545e223beea7f053787a9fc1b2af53b04ba324281a1"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.2003/dde-darwin-amd64"
      sha256 "66d2ccbb76e142f65dcbc9b6be6c5d7353817fa6f7fca53d85fe0792bd74e90a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.2003/dde-linux-arm64"
      sha256 "593e480bee3ec26b7cbcf35a03bf4f4a73bba2c833572ee01dbaa64d0694526e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.2003/dde-linux-amd64"
      sha256 "8e50a2dfc773b4c407334bd101ee58ea82e719ca46b6ccdfc91bd73f062283e2"
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
