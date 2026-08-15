class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.1/metabind-darwin-arm64.tar.gz"
      sha256 "e50e3c550368dbf7cdca4954fb246dc99a18def6dc8c400b83c4ae5989f52411"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.1/metabind-darwin-x64.tar.gz"
      sha256 "08712c0a131e868d2c9906630f882e7dfaa0e2ef79fc03ba050cee44af0ee57b"
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
    assert_match "0.10.1", shell_output("#{bin}/metabind --version")
  end
end
