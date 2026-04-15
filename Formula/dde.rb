class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-alpha.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-darwin-arm64"
      sha256 "be24a7d81affcd788dfb1bb060b2730056a559a14e7cded316da80f0531ff2b8"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-darwin-amd64"
      sha256 "05eff9a67431d09c474bad3edf9477f78cc0a132f5d301aa99518b57fe905f9a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-linux-arm64"
      sha256 "b5f7189c95b19c18d4aaa29ee6b1695bf6240bf7934efcf245523dde1960180a"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.1/dde-linux-amd64"
      sha256 "45e0ec3aa5fcff6b85d86e7ddf08f33b45ac51d95f9c53495a14055140668dc6"
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
