class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-alpha.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/2.0.0-alpha.1/dde-darwin-arm64"
      sha256 "8906a53daf5bf16904c6772c9f7acdcc3dc916b2b9e3529779174bd6169d0743"
    end
    on_intel do
      url "https://packages.dde.sh/bin/2.0.0-alpha.1/dde-darwin-amd64"
      sha256 "4032d49613cde53e8bb9a842ab1d5282eb5956001146611a5e50ed7d73d0e9be"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/2.0.0-alpha.1/dde-linux-arm64"
      sha256 "42c3d4dbd9d7d84c218a45e381562b285fb93ffd4859394922e15d978f3104ae"
    end
    on_intel do
      url "https://packages.dde.sh/bin/2.0.0-alpha.1/dde-linux-amd64"
      sha256 "a1048f679978c010404b206c9f28d3db98a7e8f123911faefacac0811aa54074"
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
