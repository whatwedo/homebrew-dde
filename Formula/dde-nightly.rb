class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261027.1025"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261027.1025/dde-darwin-arm64"
      sha256 "408cf436c5099226b1684c2866dd46a3e08412fc5cdac9de46df7c63a377592e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261027.1025/dde-darwin-amd64"
      sha256 "06b5fdf9d4f5e93486eaa6cfd6f19b7dbd1b9f0deb1b46cdd815680cce976c8f"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261027.1025/dde-linux-arm64"
      sha256 "a5999220557cb88f1bfec6c3ff860a732d7fffab79d6c18c132ac43ea9638089"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261027.1025/dde-linux-amd64"
      sha256 "1553817eb6e2b9be7909ec7eb3d4c3943777370b158bfa1aabd12298192557ea"
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
