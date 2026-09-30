class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.9/metabind-darwin-arm64.tar.gz"
      sha256 "3107192c395a2e908c4aa8afb3190608619432daec6a803cb21d660ef3f711b1"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.9/metabind-darwin-x64.tar.gz"
      sha256 "fe099a0e0754516907fbcce5db51d6debfcc2dd68fa12759f9c6b6cf1337b298"
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
    assert_match "0.10.9", shell_output("#{bin}/metabind --version")
  end
end
