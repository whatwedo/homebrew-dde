class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "92f1448a5518346d6c0e9a96aa691ed6bc38ecda36d0c89e64e6998d91108cd3"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "25522b744c78c5865c3baf143190f825889548d9dc27a128d4c346d713695dc9"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "34ae6598f502a11ee4230048942c9f14b9fd3179c0b102f4d6c8bfaf6efc55ba"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "6264b4b7483e23a3a1ded63c3852a4368ae3c632d424f7459db39d2562adad0a"
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
