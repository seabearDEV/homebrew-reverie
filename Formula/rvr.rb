class Rvr < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.2.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.2.1/rvr-macos-universal"
    sha256 "5b8f07ce0439a47b697f26179b4ccacf47d835f784e3a8546bd7b431f40dc88a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.2.1/rvr-linux-arm64"
      sha256 "4e4dd261bc74177ea2973c4d3360caeed08d36f0bff5ad254e09f3378c0ad3b7"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.2.1/rvr-linux-x64"
      sha256 "2f32eeeeedc71196dbf9e817e0f551320480858d4901ce7ae202e9a8440ab4be"
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
