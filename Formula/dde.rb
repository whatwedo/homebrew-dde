class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0-alpha.4"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.4/dde-darwin-arm64"
      sha256 "6bde0278502c9ce7dcca0ae9e900c5f8685b2f1586a7ffa4e1f0e727cd3cd6b5"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.4/dde-darwin-amd64"
      sha256 "d9818efcc27debc9ed349760c6c8d49b6833f7df2231fdf48a2edacd74dfb845"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.4/dde-linux-arm64"
      sha256 "fc15ad4ca596033ffb3f5630b8de1d2ac9a49cb3006c3fd893a85beac2760fa2"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0-alpha.4/dde-linux-amd64"
      sha256 "acc47d87bdfaadd60a3ec0e5dcadb661c5ed41557531a34edff5bec3c9306a82"
    end
  end

  def install
    bin.install version.to_s => "dde"
  end

  def caveats
    <<~EOS
      To finish installing dde, run:
        dde system:install
    EOS
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
