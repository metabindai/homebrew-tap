class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.50/metabind-darwin-arm64.tar.gz"
      sha256 "52c21f9ef3b2de6a91942d2c109e7e1d5b255c9d2c091a0e917c7af29ee3f793"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.50/metabind-darwin-x64.tar.gz"
      sha256 "19e100aef366e9cd8f6ce0bcb02e63ee6241cabf61f59be18c2c40ed01f01bd5"
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
    assert_match "0.8.50", shell_output("#{bin}/metabind --version")
  end
end
