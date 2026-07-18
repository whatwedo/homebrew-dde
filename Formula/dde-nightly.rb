class DdeNightly < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "20260718.1032"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  conflicts_with "dde", because: "both install /usr/local/bin/dde (or equivalent)"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1032/dde-darwin-arm64"
      sha256 "c705e1b5eea34abe17f574545a36fc5f3d0bfe4b700eef6d1418fb66898a18e2"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1032/dde-darwin-amd64"
      sha256 "f960afb9bbf7b43b56ec6685bc8b8b9fda4a8728bd402721fe4f233181a90bdc"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1032/dde-linux-arm64"
      sha256 "b3ef9de4ee3fe7ac3dbc3a3cea619930b1db29dc3a959a6994db038f93509f52"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew-nightly/20260718.1032/dde-linux-amd64"
      sha256 "9857a62736831019adfd0dd1ffb346671d11937b28199afad57a2d54a031cd31"
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
