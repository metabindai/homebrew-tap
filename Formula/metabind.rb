class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.48/metabind-darwin-arm64.tar.gz"
      sha256 "d2a9d152b34975e94e1d2079322f79f45cb9b62f4217cd8719050e3e3f8b7650"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.48/metabind-darwin-x64.tar.gz"
      sha256 "6dfafcef8ff5715816bb0fad2f8cadd3485506789c087b10106c92c17d95e945"
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
    assert_match "0.8.48", shell_output("#{bin}/metabind --version")
  end
end
