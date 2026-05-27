class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260527.2254"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260527.2254/dde-darwin-arm64"
      sha256 "abb097390fa67a4db517d4c5de193793945922ef6d9e63aa47da2ffb554d7eb2"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260527.2254/dde-darwin-amd64"
      sha256 "2e23d2b9b670cb08117723b8d2b2416f48d4e83e39727d26242a4ff75397bcca"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260527.2254/dde-linux-arm64"
      sha256 "4f92eab9a4717c9a1cb4edb5e3d92c3a0594357cb31bb6dc0e6963dc989bdedd"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260527.2254/dde-linux-amd64"
      sha256 "d5778f3879bcabcaf58c6f59deda978aaa26241770c7734e06af121a3adbdc63"
    end
  end

  def install
    bin.install Dir["dde-*"].first => "dde"
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
