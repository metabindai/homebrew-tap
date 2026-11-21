class Metabind < Formula
  desc "Build and ship MCP apps from the command-line"
  homepage "https://metabind.ai"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.20/metabind-darwin-arm64.tar.gz"
      sha256 "f1ad2944d810ec8ba8d46b764813bbce660ac61e345aed677b194e6ef13ce77f"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.20/metabind-darwin-x64.tar.gz"
      sha256 "7b7d418cbd773a476f65799eeb49369e1cba0d21d55d316389c956c9d16619ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.20/metabind-linux-arm64.tar.gz"
      sha256 "cd99bf7e61778b59ae8d35f481bfe73686b8b4c118c7b2734cda1b6592ead439"
    else
      url "https://github.com/metabindai/homebrew-tap/releases/download/v0.10.20/metabind-linux-x64.tar.gz"
      sha256 "949528106c479e55c3a395ae8290a49e1bdd4616e1e23b5548538fd65b6e2aa6"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "metabind-#{os}-#{arch}" => "metabind"
  end

  test do
    assert_match "0.10.20", shell_output("#{bin}/metabind --version")
  end
end
