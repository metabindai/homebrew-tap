class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://github.com/metabindai/metabind-cli"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.3/metabind-darwin-arm64.tar.gz"
      sha256 "c81b95700d6fff5268151bbe3c79fc9db63327744db531e0dd01a1e30ebd3548"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.3/metabind-darwin-x64.tar.gz"
      sha256 "8b15c7eef0c5407c4a1b8222e4e4b36cd67f9e54263b23a8dd2699fdc015a818"
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
    assert_match "0.10.3", shell_output("#{bin}/metabind --version")
  end
end
