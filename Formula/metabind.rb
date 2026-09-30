class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.8/metabind-darwin-arm64.tar.gz"
      sha256 "6db4d78abb9d13a23b53b61ecdcaac49b689448f2817ebdbf17899f594df14df"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.8/metabind-darwin-x64.tar.gz"
      sha256 "351eff8d7231159e70430453759a57f899541f9be324bfde101bc4b352c39cbc"
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
    assert_match "0.10.8", shell_output("#{bin}/metabind --version")
  end
end
