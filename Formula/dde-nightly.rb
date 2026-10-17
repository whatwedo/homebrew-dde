class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261017.0226"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261017.0226/dde-darwin-arm64"
      sha256 "855516ee3c77e57ceaf1f705fb366b4cfd3494e6355696ab99f9da4475b379a4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261017.0226/dde-darwin-amd64"
      sha256 "b64ed9f67f69ad85bb65ae241b50823cb111334f76651a5c7f30e9063c9d707e"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261017.0226/dde-linux-arm64"
      sha256 "786799e354a60111823dcb7086e48496089d9bf075db2b11c61378b10ee0892b"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261017.0226/dde-linux-amd64"
      sha256 "b435503538f6785f03e1afe5d4ff82d90d1d39662f7f1d0de8a133cb78346fe5"
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
