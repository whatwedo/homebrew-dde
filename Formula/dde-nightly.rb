class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260730.1452"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260730.1452/dde-darwin-arm64"
      sha256 "b240b1c6ad258ab7334a9025f54b4d7267a911e86a84ac71766e46cd00e12acb"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260730.1452/dde-darwin-amd64"
      sha256 "14bb31ed872acd842be14f74e0305171d74e31dec7162365731f78e9bbf424a1"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260730.1452/dde-linux-arm64"
      sha256 "e68a0227fb7b872cd45d4cfe0ef4ea0d42d48fad0e9f33fa6f00b4cf962d2bf2"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260730.1452/dde-linux-amd64"
      sha256 "66ace683ab4388752f70c85541ecc69fb3424bd7ab8323c6df548083710c63f7"
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
