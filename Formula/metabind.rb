class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.12/metabind-darwin-arm64.tar.gz"
      sha256 "0df4fc362e5f10571edb0816d4ec586d3ddd890128d9523a32052d22140e158e"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.12/metabind-darwin-x64.tar.gz"
      sha256 "20141007f42abc180054873c5eec1d4f4696f24455c1da181223145953b53655"
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
    assert_match "0.10.12", shell_output("#{bin}/metabind --version")
  end
end
