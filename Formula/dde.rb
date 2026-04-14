class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-alpha.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/2.0.0-alpha.1/dde-darwin-arm64"
      sha256 "74ea982ced80bedfde6de5fb287a13579ff69806fbacec25e3539910e748e984"
    end
    on_intel do
      url "https://packages.dde.sh/bin/2.0.0-alpha.1/dde-darwin-amd64"
      sha256 "575082228865706bf03edc7ae83dfd4cfe9cd55f5ebb92f83dae74598988ab16"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/2.0.0-alpha.1/dde-linux-arm64"
      sha256 "10c5659226b5a99a2f191d338b062fc8bbe51c641f66b9d0bfa6eb0b3cbc16f1"
    end
    on_intel do
      url "https://packages.dde.sh/bin/2.0.0-alpha.1/dde-linux-amd64"
      sha256 "c701e1dffdaa02e9853e57c9628e1b54e8506aff42349816f436af576b0a62ce"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "dde"
  end

  def post_install
    system "#{bin}/dde", "system:install", "--no-interaction"
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
