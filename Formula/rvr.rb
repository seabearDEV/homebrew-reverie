class Rvr < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.1.0/rvr-macos-universal"
    sha256 "943ed10ed7b50ea322fa850a2db5dc977b9db75b864b1c70210f9badf0df755e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.1.0/rvr-linux-arm64"
      sha256 "205ad0cb197015e47e03dbe47f371fdf343385569068732d41543e7bc03a0a13"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.1.0/rvr-linux-x64"
      sha256 "40600c32f38fc334898db1b71d1e1cac523a7f040c6190c1c891efcf419aa927"
    end
  end

  def install
    binary = Dir.glob("rvr-*").first
    bin.install binary => "rvr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rvr --version")
  end
end
