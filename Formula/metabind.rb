class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.45/metabind-darwin-arm64.tar.gz"
      sha256 "c5b3f4b141930e56699880fe73cb8724620bf926f09aa4fdbaf94494317975e7"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.45/metabind-darwin-x64.tar.gz"
      sha256 "3728ca0fae072c2521f82af0b80f546a3589e3ae495a03acbea9a47fa8805d23"
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
    assert_match "0.8.45", shell_output("#{bin}/metabind --version")
  end
end
