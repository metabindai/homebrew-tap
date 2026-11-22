class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.21/metabind-darwin-arm64.tar.gz"
      sha256 "104a60f435bc4701c2e10116b6e7836b1d21186eebc9b6d5a5345f6e8c9ab0b9"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.21/metabind-darwin-x64.tar.gz"
      sha256 "63ba80864b61d5f78299bc4071a1ecea36bc79b6546a8bf47821e9fa0d2d48a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.21/metabind-linux-arm64.tar.gz"
      sha256 "604a18db5ee5c5ad4f05ea4ad5bdcb887604846cb4b801fac1b01ac50831804c"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.21/metabind-linux-x64.tar.gz"
      sha256 "89c1816c5eab08fc05b36d388b7e6303b4e29692700cd6e0870455046c1a8894"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "metabind-#{os}-#{arch}" => "metabind"
  end

  test do
    assert_match "0.10.21", shell_output("#{bin}/metabind --version")
  end
end
