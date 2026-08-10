class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260810.1647"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260810.1647/dde-darwin-arm64"
      sha256 "7e2b14a0ce2bf68a325a4467f95370834e49cb25b4a802a4c98ef4c5cd904d31"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260810.1647/dde-darwin-amd64"
      sha256 "4061364f91dbbeb1f67a3ac7b39f416d596f255cc1ad7e053e0875cd73ba4c15"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260810.1647/dde-linux-arm64"
      sha256 "37772772dd2fdc054b5b8367086aabf9f32bffa93d96e08caca9b7f31be60865"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260810.1647/dde-linux-amd64"
      sha256 "0738a2b429c7693ebcb25222f03d8a270c4db07fe1810f111350c82420ab77f1"
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
