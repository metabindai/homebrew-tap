class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.10/metabind-darwin-arm64.tar.gz"
      sha256 "e505d4ee04d2ec915ad4a7b5468bed95f99e9778d9814b16012e090ca6546db1"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.10/metabind-darwin-x64.tar.gz"
      sha256 "cbbe5fe68ab62d35e98ed3db902c30741ab84e947b8c7d48c42504ccb2db5367"
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
    assert_match "0.10.10", shell_output("#{bin}/metabind --version")
  end
end
