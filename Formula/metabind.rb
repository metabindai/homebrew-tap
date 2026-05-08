class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.47/metabind-darwin-arm64.tar.gz"
      sha256 "e39ce746f5b35eb79887b96bc33be3ed0789ce40edb176d2ab3bb1b5fddcbbe3"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.47/metabind-darwin-x64.tar.gz"
      sha256 "705f4792387afd705182075e47b0609ae55f692fb76bbf7687e679978a751bc3"
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
    assert_match "0.8.47", shell_output("#{bin}/metabind --version")
  end
end
