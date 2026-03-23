class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "76dd7dd8ad0ef16f2f5695586a86ac18e2527e3e07b3a17aed7b94d856377365"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "d0dbe82090e638bdb07fdeed61e65b550721cbd2ca442983e11b4f1771315530"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "ee36c0f03949902966f2218cc23dcbaad80f8c1bac0e590a9dcb61ed7c8c7623"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "84253c7807bec65a366174bfc8abe5a2b4b5325132efaf7836f0ba575e8518e7"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "dde"
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
