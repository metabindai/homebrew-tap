class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.42/metabind-darwin-arm64.tar.gz"
      sha256 "b9a350b66e0c997f3b1e95e2a5ef27ddca7703fcb14ecd58749760c940fbf1e8"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.42/metabind-darwin-x64.tar.gz"
      sha256 "e886bb539b4cf69e101c96a35cb330506f96a3940b1cb1b07125fb206ed42dc1"
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
    assert_match "0.8.42", shell_output("#{bin}/metabind --version")
  end
end
