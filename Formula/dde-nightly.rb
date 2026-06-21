class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260621.2035"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2035/dde-darwin-arm64"
      sha256 "f775894b177f1e8c7b94757bd922a70769d3e0113e22896fe35891c47f75c7d9"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2035/dde-darwin-amd64"
      sha256 "98d6f1364be092d2e50939534b37ff0731eb765b1568e896156fffd8de3357fe"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2035/dde-linux-arm64"
      sha256 "cfd85eaaae91990827838d30d7f62867c871176154407ec2879a04ae0c75cde0"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260621.2035/dde-linux-amd64"
      sha256 "3fd38d17910ad84176f31a341561e56d9623977dfe4085c4702cc2c0304b7ea5"
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
