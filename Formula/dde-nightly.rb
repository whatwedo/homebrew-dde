class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260730.1518"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260730.1518/dde-darwin-arm64"
      sha256 "b17cd484beaae4faa21bb4151cf3505b4013223e4d541766645b65325d1c52c3"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260730.1518/dde-darwin-amd64"
      sha256 "3da41714f1c54ecf51aaa557bd6ceebaa1672a6c5cb9c76e0ad74323b81b01b6"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260730.1518/dde-linux-arm64"
      sha256 "2eb718edf7ed96ddf359c6fecf07d88b93063d4ece85d5adac3ee8e0308a9649"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260730.1518/dde-linux-amd64"
      sha256 "55007fc8dac394fc78c2b71160a967f0ba2eea298310ce4cb0533031a0ee70e5"
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
