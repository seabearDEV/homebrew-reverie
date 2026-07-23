class Rvr < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.3.0/rvr-macos-universal"
    sha256 "24a6ce27ebd3e314f369fc54424698b30260f4d4f11fb51ff16170a1c857a6f8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.3.0/rvr-linux-arm64"
      sha256 "2b824712ee1422e8cf3ad2db2e7862d23a374e148fd052319060a2d8645ceb08"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.3.0/rvr-linux-x64"
      sha256 "5c37abc54d063a9bf3caf1dd5ada926c1c40806cfe84280715245937a48c5661"
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
