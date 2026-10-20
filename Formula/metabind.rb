class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.13/metabind-darwin-arm64.tar.gz"
      sha256 "916f8ab4cca2570712d4613aed0d0bc07ef95f1e2d9144ab4deedef48a90149a"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.13/metabind-darwin-x64.tar.gz"
      sha256 "a45146b0da4022225a4c0b2c77cba5f8f6ebbdfabf037d8f84f71f7c02be8531"
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
    assert_match "0.10.13", shell_output("#{bin}/metabind --version")
  end
end
