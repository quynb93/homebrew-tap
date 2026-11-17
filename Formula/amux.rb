class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.7.0/amux-aarch64-apple-darwin.tar.gz"
      sha256 "5437f2284d568ee5fd8577305ab3c7f3aa05773755f3235bdaf27ff8278ad7ce"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.7.0/amux-x86_64-apple-darwin.tar.gz"
      sha256 "4ea481bc84f8883f9b40c733169e81f27510a0d57a0ca1ba7018bc3c8d024703"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.7.0/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "871ebe174c18d02ba2199187cf8ec01739d3a80e27edca78a0b94431c9a04ee2"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.7.0/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "53f9670381808fc5f590414ffdd0913dbc72163b86cd6eb55ea9b9000ece9203"
    end
  end

  def install
    bin.install "amux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/amux --version")
    ENV["AMUX_HOME"] = testpath/".amux"
    ENV["AMUX_NO_UPDATE_CHECK"] = "1"
    assert_match "No accounts yet", shell_output("#{bin}/amux account list")
  end
end
