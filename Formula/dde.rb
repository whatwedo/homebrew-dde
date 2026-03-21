class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/bin/dde-darwin-arm64"
      sha256 "e56a6d4ec31b249c127277c50bea81ff95ca1bae906e51e144abd4b89a9a8030"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-darwin-amd64"
      sha256 "1157ea02514dcfaa0565857d894bb11ca982a667faf301e59106c4cd7c8d699a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/bin/dde-linux-arm64"
      sha256 "c109bf41cbf18bbfb98b31ab04aef904ce7a5b74dceed18eb8ec4a936ba8b52f"
    end
    on_intel do
      url "https://packages.dde.sh/bin/dde-linux-amd64"
      sha256 "3287a1dea7485555f383ce4eb8e00692075f3f8027e89d528c987ba353bfba44"
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
