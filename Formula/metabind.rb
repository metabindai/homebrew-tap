class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.18/metabind-darwin-arm64.tar.gz"
      sha256 "649c990bb0ec37b692adfb8514c49ecc041dad6f50c9534b3a32594612c17d3f"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.18/metabind-darwin-x64.tar.gz"
      sha256 "eda1fdc541317ef0cb1faae3537e33dabe18fcb8bfbb6d0b252540e3025b3d23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.18/metabind-linux-arm64.tar.gz"
      sha256 "2f950d4fd30e81ba42f06bbaf36625a907bad1190dfdca479d1d774ad231a08b"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.18/metabind-linux-x64.tar.gz"
      sha256 "b38f94ec0dac35053d3e3216a3166361ba019412bd19d45b79dc9f8ac1df265a"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "metabind-#{os}-#{arch}" => "metabind"
  end

  test do
    assert_match "0.10.18", shell_output("#{bin}/metabind --version")
  end
end
