class Metabind < Formula
  desc "Metabind CLI for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.53/metabind-darwin-arm64.tar.gz"
      sha256 "071d3ee17148086e3eb4a4e6dfef935896c55a9bac61d5e1c06402ba967eaf79"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.53/metabind-darwin-x64.tar.gz"
      sha256 "79ba13b36c3df24a70ceadae9b28c4366f6def8134ed5145d538d3193fc22b49"
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
    assert_match "0.8.53", shell_output("#{bin}/metabind --version")
  end
end
