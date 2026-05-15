class Metabind < Formula
  desc "Metabind CLI for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.51/metabind-darwin-arm64.tar.gz"
      sha256 "65a8e796357d33ba5bd9a98ee0f2c437cf8fbc1df3e48afc90d2912e478882fb"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.51/metabind-darwin-x64.tar.gz"
      sha256 "ac9d3230cd12619c7cb28b45428819dd1a162ba80e60ec0f453d690c0baeb926"
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
    assert_match "0.8.51", shell_output("#{bin}/metabind --version")
  end
end
