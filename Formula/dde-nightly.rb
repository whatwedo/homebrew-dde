class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260724.2346"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.2346/dde-darwin-arm64"
      sha256 "1bc7de5845220c046f06f116c946f62ece29dac23dc7b9e6cae9981faaf4fda5"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.2346/dde-darwin-amd64"
      sha256 "f3006df16473a1f3fe270b7dc1a86e0f6f2774517492abbea9803238ec262ac6"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260724.2346/dde-linux-arm64"
      sha256 "c6781bd8df7a34228d35c53dc763435afcda9796a241966f567165c5d3742f6f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260724.2346/dde-linux-amd64"
      sha256 "42e0f02a603110c56cafb4ea4373d6514c9d5828f0996ea61cdf9ccdae8e9ec3"
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
