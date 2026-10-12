class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20261012.1923"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1923/dde-darwin-arm64"
      sha256 "c50167f7ce8cd8765991d2a17dc40c24bbaa862046f7e12c0a7a1c4e20b5c5da"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1923/dde-darwin-amd64"
      sha256 "3b05ef5bc75a3c33ee706cfa479dc3897c02c9bd655da180b7282d40d056bd89"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1923/dde-linux-arm64"
      sha256 "4f8cbc7e939162ef74b0f1262c08a9a166859efb2e6e2b0fab90ba914ed2f5e3"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20261012.1923/dde-linux-amd64"
      sha256 "18937a7105795f998540f8e83f6a9657aed22c60e948e857abdffef32dde9ad7"
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
