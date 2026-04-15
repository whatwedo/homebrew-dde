class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages-test.dde.sh/homebrew/2/dde-darwin-arm64"
      sha256 "1bc037539cb9ca5b4fd03db3ca225c96724c9717ad98602ed7af73d507c45998"
    end
    on_intel do
      url "https://packages-test.dde.sh/homebrew/2/dde-darwin-amd64"
      sha256 "82ac039d89c73b2492f6b2f973867e63d83f4009d5cc55ac1922aa7963eb5369"
    end
  end

  on_linux do
    on_arm do
      url "https://packages-test.dde.sh/homebrew/2/dde-linux-arm64"
      sha256 "fab2cc82203dca537dd5e86d062e8350caf6a3acd864e18cdb2a8cd0c36e92f4"
    end
    on_intel do
      url "https://packages-test.dde.sh/homebrew/2/dde-linux-amd64"
      sha256 "65ab18c6d07d1503be7d842ecdd02ecf018424c48f36fe7b28e9215634add214"
    end
  end

  def install
    bin.install version.to_s => "dde"
  end

  def post_install
    system "#{bin}/dde", "system:install", "--no-interaction"
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
