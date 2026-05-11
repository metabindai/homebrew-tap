class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.49/metabind-darwin-arm64.tar.gz"
      sha256 "221d114674fba644aed66b4300b1fc8e64c96995e8c606968c8ed33510bc3bbe"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.49/metabind-darwin-x64.tar.gz"
      sha256 "3069249a694288664e527ec3be28b16383f86876da1195f8657206ea157bb06a"
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
    assert_match "0.8.49", shell_output("#{bin}/metabind --version")
  end
end
