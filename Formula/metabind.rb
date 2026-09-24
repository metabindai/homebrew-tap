class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.5/metabind-darwin-arm64.tar.gz"
      sha256 "6ee477adc5202cfb77c3d27922f6efe8dc45db5315ce2ea5e79b554d227fdaf9"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.5/metabind-darwin-x64.tar.gz"
      sha256 "286c190eb2d55d9357a8c289d9a7c9e4c1bbab2993bfa63c5ed0c82e49634b2c"
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
    assert_match "0.10.5", shell_output("#{bin}/metabind --version")
  end
end
