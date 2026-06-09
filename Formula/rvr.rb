class Rvr < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.2.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.2.0/rvr-macos-universal"
    sha256 "6b58db7dbd4cef3d20da105587a606e5fce807d5aa9c76baa89a21a7e57756c6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.2.0/rvr-linux-arm64"
      sha256 "10e1609b6c065a5d67735f15b3a660dc342f23698b1e5894056966a7327c3714"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.2.0/rvr-linux-x64"
      sha256 "496e61e97ddbbba5e5290a74cbe2cfd0be59f1731756b57625e7f9d7e98fb1a7"
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
