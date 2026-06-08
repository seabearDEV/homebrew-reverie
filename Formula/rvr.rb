class Rvr < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.1.1/rvr-macos-universal"
    sha256 "acb2bc5e44d15671cf8609955c07159c86aec1a7faa7674f87da3d804f4d70df"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.1.1/rvr-linux-arm64"
      sha256 "67be2c6a35bcd88aed0b0680edf1cb0e133f6c8e87fc1109e55086e6162b0681"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.1.1/rvr-linux-x64"
      sha256 "c9113923693f207e9c11b11942da0b74f7d9b0fc9765431b27398cb18d654f49"
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
