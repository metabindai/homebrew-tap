class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.2/metabind-darwin-arm64.tar.gz"
      sha256 "195b8183842375d39ad1faa3275a617b353629ebc57bb429f8d95a7eb76e6e16"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.2/metabind-darwin-x64.tar.gz"
      sha256 "a1137df04e29a91a793842b1d738670f18ad3eb269359d79c989021ea3f627c2"
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
    assert_match "0.10.2", shell_output("#{bin}/metabind --version")
  end
end
