class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.16/metabind-darwin-arm64.tar.gz"
      sha256 "636b2c8345e9d82ba578d353d5ab03d466e984d6b7e112b6d1e5a7f7f4e4ef97"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.16/metabind-darwin-x64.tar.gz"
      sha256 "8f66fd8081b15cbc24f8ebf8ec606a2c2ce5cf67fcff9586b1e1c69a379e34a2"
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
    assert_match "0.10.16", shell_output("#{bin}/metabind --version")
  end
end
