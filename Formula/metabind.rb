class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.44/metabind-darwin-arm64.tar.gz"
      sha256 "b9fbb9f893afea643e27ced44c383fb9378cb9798235b3ecf427372d5cc569e4"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.44/metabind-darwin-x64.tar.gz"
      sha256 "296823603a6f823bcd860f16dd021554b10e227ced0b7ded8f861403c7f899af"
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
    assert_match "0.8.44", shell_output("#{bin}/metabind --version")
  end
end
