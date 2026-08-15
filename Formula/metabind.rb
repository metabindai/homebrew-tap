class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.0/metabind-darwin-arm64.tar.gz"
      sha256 "0d5c67d0d79c3ace9b15c2e1eb3ded1e12d46d4095035b627ead85f2b2fe1957"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.0/metabind-darwin-x64.tar.gz"
      sha256 "5d87930613bf29ec86dc91f9677cb71eb998b0f01906edf3f72292e4f450f66e"
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
    assert_match "0.10.0", shell_output("#{bin}/metabind --version")
  end
end
