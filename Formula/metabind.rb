class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.15/metabind-darwin-arm64.tar.gz"
      sha256 "fed06ce5e8e8572aa485ab4aadaaf85eae0b9ffdfd9389b188f828c1f6746a87"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.15/metabind-darwin-x64.tar.gz"
      sha256 "b974b9b8842df4f3e702774acc1fdcabef4624508e0335896d8a8dfd4f02d45e"
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
    assert_match "0.10.15", shell_output("#{bin}/metabind --version")
  end
end
