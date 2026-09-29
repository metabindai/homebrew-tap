class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.6/metabind-darwin-arm64.tar.gz"
      sha256 "afb9c8ee32ae15a326ab261ab475c75514c34594fa8c0966be9482ad4ec93ba1"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.6/metabind-darwin-x64.tar.gz"
      sha256 "ff1b9370f6debc8fa468ddd257bb63b31c9dfb2c6e54de8f5a1027a758228d3d"
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
    assert_match "0.10.6", shell_output("#{bin}/metabind --version")
  end
end
