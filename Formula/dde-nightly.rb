class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260522.1122"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260522.1122/dde-darwin-arm64"
      sha256 "4f0839d909aa22b31e803e0838d0147ec83eaec66a9b371695dabf2b3ca68d09"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260522.1122/dde-darwin-amd64"
      sha256 "9dbe3c1d002d831255cf6d6dd05ed6bd5e57b2abbc13afda80d200b092225b70"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260522.1122/dde-linux-arm64"
      sha256 "688712e59f3bf964253aaf2f5a95ad8ce590101383d6e7927f7dcea6dd662944"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260522.1122/dde-linux-amd64"
      sha256 "d2517017a0f54311c8be38c73ec16fe1b2e633b150540c68a4cf254f3039971a"
    end
  end

  def install
    bin.install version.to_s => "dde"
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
