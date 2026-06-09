class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260609.2148"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2148/dde-darwin-arm64"
      sha256 "be94b20a1c8d9b176f3841ee133d8dc86417ec325af0ec35ca535d687156f27e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2148/dde-darwin-amd64"
      sha256 "157262f513808a2d6dc88808f120fd6e006efd182a9b183bf1917afaf44ef610"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2148/dde-linux-arm64"
      sha256 "26e646d65e5f4d2870d37ac35ccd469ff65c64f759667b854152b33811c729f5"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260609.2148/dde-linux-amd64"
      sha256 "19a21441bcff9ceeae6ab9b3a034326b33b4d49b21a859752d33566f57e58b60"
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
