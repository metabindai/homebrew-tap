class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.14/metabind-darwin-arm64.tar.gz"
      sha256 "aa598302182cd3c8bd075163f924bc6928363637a023e89e9833e3e0b3e25390"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.14/metabind-darwin-x64.tar.gz"
      sha256 "51c48aac051ac58fb40c3c3dc01522f49d118fc364ba9faa892a23ff4cadbf25"
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
    assert_match "0.10.14", shell_output("#{bin}/metabind --version")
  end
end
