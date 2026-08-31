class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260831.0209"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260831.0209/dde-darwin-arm64"
      sha256 "8c3e07eee9823d611858fcbb58bdefa28e5257d795449023d5465e68472c943e"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260831.0209/dde-darwin-amd64"
      sha256 "79b3aad03752efb25a9283a545c5aac6725602a2052f6d45720bd3f2cabc7bb7"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260831.0209/dde-linux-arm64"
      sha256 "b685a2058cb4d9d9816ba671913cfe926ac70796da4531c748dce0b9a45f8b98"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260831.0209/dde-linux-amd64"
      sha256 "b64b92796ee34859a61f73db8938241b7d41265ef9798eafae9381f708d5d44e"
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
