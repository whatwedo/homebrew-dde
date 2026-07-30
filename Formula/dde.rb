class Dde < Formula
  desc "Docker Development Environment"
  homepage "https://github.com/whatwedo/dde"
  version "2.0.0"
  license "AGPL-3.0-or-later"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0/dde-darwin-arm64"
      sha256 "b9a4d33b36b1a09f451670a471f59367a23bf2e95b446e361da34bbc4e04a42f"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0/dde-darwin-amd64"
      sha256 "316b1ecee13c9e1e8ab8bf5ffa874ce504127c080eb3bda74c030fa4c8c5421a"
    end
  end

  on_linux do
    on_arm do
      url "https://packages.dde.sh/homebrew/2.0.0/dde-linux-arm64"
      sha256 "5e126635088083abfc57dda4adfdcd6cb0df43bc53794f475653a345f72a7fdd"
    end
    on_intel do
      url "https://packages.dde.sh/homebrew/2.0.0/dde-linux-amd64"
      sha256 "70cef5dbe98bf528cf95307ad36627c17ca0e582efe65cb8efc391b388410623"
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
