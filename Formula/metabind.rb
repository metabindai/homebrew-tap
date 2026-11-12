class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.17/metabind-darwin-arm64.tar.gz"
      sha256 "44925a2db0108e1aa7ea4e75de681e10c6ca5ccec192cadb49e90358041788dc"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.17/metabind-darwin-x64.tar.gz"
      sha256 "6a114e1072d1075fecc08afca485cfd4bcc2e0f467879595b4a1c6ec31ab16a2"
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
    assert_match "0.10.17", shell_output("#{bin}/metabind --version")
  end
end
