class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.7/metabind-darwin-arm64.tar.gz"
      sha256 "fe7f9754d7124d98cf27cf677209c714175fdc25cb2da8b4f1baef0ec63f4d9e"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.7/metabind-darwin-x64.tar.gz"
      sha256 "a44d7c35097b7afe4352b857dd2eef45d477485a898fe26e8f1fcd785b8f4aab"
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
    assert_match "0.10.7", shell_output("#{bin}/metabind --version")
  end
end
