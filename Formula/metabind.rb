class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.41/metabind-darwin-arm64.tar.gz"
      sha256 "451b17648e6d2175b5010935d3cbdccd8c7b54f1f7ae984ada8fe8dbf59a9d53"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.41/metabind-darwin-x64.tar.gz"
      sha256 "7b276c0fa913533311a09390f51db7ce4e8cb6a06e1a27b382377bfe31a64db2"
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
    assert_match "0.8.41", shell_output("#{bin}/metabind --version")
  end
end
