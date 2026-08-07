class Metabind < Formula
  desc "Metabind CLI for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.9.0/metabind-darwin-arm64.tar.gz"
      sha256 "71e6607c8601218b2dec0bdb40e72a5c007f9c6519099f47357180c70fc34eff"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.9.0/metabind-darwin-x64.tar.gz"
      sha256 "492382cce8316bac7f9cb5eb6210611976d0d8de9ad756eab3b0c2505b39cce7"
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
    assert_match "0.9.0", shell_output("#{bin}/metabind --version")
  end
end
