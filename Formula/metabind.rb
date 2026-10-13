class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.11/metabind-darwin-arm64.tar.gz"
      sha256 "5e3b3c8e187ab703fc5832bc672304441a282c0a7ab692f901a98f18dab31e4c"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.11/metabind-darwin-x64.tar.gz"
      sha256 "998de88d960d351d8fe7ba55335254fd8c471d1b7efa9fcc59b297976cf46b3b"
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
    assert_match "0.10.11", shell_output("#{bin}/metabind --version")
  end
end
