class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261102.0858"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261102.0858/dde-darwin-arm64"
      sha256 "4fa9fb79df2378d7f573774128145fcccb3aa01cb42451a7587ea9556bfd5d97"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261102.0858/dde-darwin-amd64"
      sha256 "d2c0f7c1cc614566928eb7048571f52ff19213b6d7e2220a10aacb2a1be5c54c"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261102.0858/dde-linux-arm64"
      sha256 "99c1e0910216e8a9b7e7bf0898eaf31ca139ef754c73ce3745a0876910299d39"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261102.0858/dde-linux-amd64"
      sha256 "9c8831c50d9c5bbddc7650f1e7f84a71a040f8696a08dbb257bbb7537b8de4d0"
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
