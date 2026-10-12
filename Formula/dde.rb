class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.1.0"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.1.0/dde-darwin-arm64"
      sha256 "b093b0fde4ef056223ad2eb85ff461a06d98e528128547fdf48d3f48827fc953"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.1.0/dde-darwin-amd64"
      sha256 "5cc3cacfbe050e763c5d760e163fb7effb27cd1e0742d5e295386cd63bb34b68"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.1.0/dde-linux-arm64"
      sha256 "cf13d9ae6e4c46796cdb3cd015936a3202dd62e11bda71af3c3431d3b20dd0c4"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.1.0/dde-linux-amd64"
      sha256 "043fc56278ffaaac497b711d31e138fa584ff6f5d997338654d344f123287fb2"
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
