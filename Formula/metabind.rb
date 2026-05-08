class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/metabindai/metabind-cli"
  version "0.8.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.43/metabind-darwin-arm64.tar.gz"
      sha256 "9acb359b90010759284e19f0cc9f5e22df433690fff676a48da8a9a95d0de805"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.8.43/metabind-darwin-x64.tar.gz"
      sha256 "52c54bd97342d1f518d2d758322abaeba4140ff7c9e322b38eddee66050d8c3c"
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
    assert_match "0.8.43", shell_output("#{bin}/metabind --version")
  end
end
