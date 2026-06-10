class Rvr < Formula
  desc "Bicameral memory for AI-assisted development — CLI + MCP server bootstrapping persistent project context across sessions"
  homepage "https://github.com/seabearDEV/reverie"
  version "1.2.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    url "https://github.com/seabearDEV/reverie/releases/download/v1.2.2/rvr-macos-universal"
    sha256 "b94acc4462e4f76fc82133342b158ff4bc79a65e3435675d8c61f22355b79a77"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seabearDEV/reverie/releases/download/v1.2.2/rvr-linux-arm64"
      sha256 "7cc3db220fa5757d01fa666b87d411d919a422238e3023da83104166a4ad41d8"
    else
      url "https://github.com/seabearDEV/reverie/releases/download/v1.2.2/rvr-linux-x64"
      sha256 "f380d835a6529b78a5df38c24c035c0a4759365ef2344390cedc473238418207"
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
