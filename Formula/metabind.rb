class Metabind < Formula
  desc "Metabind CLI for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.54/metabind-darwin-arm64.tar.gz"
      sha256 "21513bc02198a603e247618112e8b63cda44bf8df055c162684076dced71c8c0"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.54/metabind-darwin-x64.tar.gz"
      sha256 "717dcf0a8eb4566009d2a3ac13aa13d1095d99e3c44a6e84e988c81f3997038c"
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
    assert_match "0.8.54", shell_output("#{bin}/metabind --version")
  end
end
