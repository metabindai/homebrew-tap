class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.4/metabind-darwin-arm64.tar.gz"
      sha256 "931e4f7ac19bc17eb503ed5afc175c07d66510765efd8847448c91703394f0c0"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.4/metabind-darwin-x64.tar.gz"
      sha256 "6a6fb17d9ca3e8de3d30521765ecdb548a4fea35d8e23c72385ebc1629fcd96f"
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
    assert_match "0.10.4", shell_output("#{bin}/metabind --version")
  end
end
