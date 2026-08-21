class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.1"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.1/dde-darwin-arm64"
      sha256 "0fbea86f91de3d8c385cf78d5823c429e30ab5dde5bdf87e41ea00c6bce48801"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.1/dde-darwin-amd64"
      sha256 "14eb6f779227c6eecad4e8b8ce7ed092348a51d590f3716129e1d8a3395b5bf9"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.1/dde-linux-arm64"
      sha256 "bd2cc9ebbc58943bf3464b5fbd6c7b0175b97dcec471a4a4f86f0618a1f67166"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.1/dde-linux-amd64"
      sha256 "cf57829861c5e6f38c978f95e38a7fc2190694628e1e6ee4b43afb1ff8437693"
    end
  end

  def install
    bin.install Dir["*"].first => "dde"
  end

  def caveats
    <<~EOS
      After installing dde for the first time, run:
        dde system:install

      After upgrading dde, run:
        dde system:update
    EOS
  end

  test do
    assert_match "dde", shell_output("#{bin}/dde --version")
  end
end
