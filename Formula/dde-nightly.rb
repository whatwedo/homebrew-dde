class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260723.1908"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1908/dde-darwin-arm64"
      sha256 "2ce272c1124d74fd17bd647e7d41d092c04a01d684b052024197c9144f80be7b"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1908/dde-darwin-amd64"
      sha256 "604410e888d2be16cbd037a20fd51df7fcfe6fd2b8656e035258e8754fae21f4"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1908/dde-linux-arm64"
      sha256 "9b3e3633b215ed4f6132a969992198d0678239f72fd0b6c37d1fe6a5c1604fe6"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260723.1908/dde-linux-amd64"
      sha256 "cdece358fcd971e79d7f24e05bdf23037c99300ad04ef5b0c06f62c6abd84857"
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
