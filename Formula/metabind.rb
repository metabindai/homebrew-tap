class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.46/metabind-darwin-arm64.tar.gz"
      sha256 "fe8adb8d10f5869bea9bbaeac98f86f338ea4c650e9ad07f05a73ca37abe1cda"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.46/metabind-darwin-x64.tar.gz"
      sha256 "492b6c510e505f176e79bf04c359d7dd090ca769f52ee338dee3015b08226616"
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
    assert_match "0.8.46", shell_output("#{bin}/metabind --version")
  end
end
