class Metabind < Formula
  desc "Metabind CLI for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.52/metabind-darwin-arm64.tar.gz"
      sha256 "6ac00ab6a8159e86480e08f04b96677c584d15b8271affc69c9dd78c1f7e8ecd"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.52/metabind-darwin-x64.tar.gz"
      sha256 "d4811428c1f053de7ed3c74eaa83b71f81ee2f66dad4645d8e8a741509009ff2"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "metabind-darwin-arm64" => "metabind"
    else
      bin.install "metabind-darwin-x64" => "metabind"
    end
  end

  test do
    assert_match "0.8.52", shell_output("#{bin}/metabind --version")
  end
end
