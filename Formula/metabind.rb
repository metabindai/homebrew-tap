class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.19/metabind-darwin-arm64.tar.gz"
      sha256 "7429470008013a1bc667e8ac893cc52665f971ab7b2a8f51b229cb6acf29df79"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.19/metabind-darwin-x64.tar.gz"
      sha256 "d8ed37f26132d02fe10cfc8ef87c3be8df88fc1ba046df371ef2c89c67b5121f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.19/metabind-linux-arm64.tar.gz"
      sha256 "dcd97193c16ac357c726b32179723c051002bdf53e4700131510b0b304326d8b"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.19/metabind-linux-x64.tar.gz"
      sha256 "92ba023c83864f2b5bbefca63532249692295aa4a5bec956c0eb72590c2b23f6"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "metabind-#{os}-#{arch}" => "metabind"
  end

  test do
    assert_match "0.10.19", shell_output("#{bin}/metabind --version")
  end
end
