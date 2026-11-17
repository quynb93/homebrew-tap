class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.6/amux-aarch64-apple-darwin.tar.gz"
      sha256 "1a3ef1ba6a75a6c9aa368292c3e445a60f706e512cc561a80c515a4792333ad0"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.6/amux-x86_64-apple-darwin.tar.gz"
      sha256 "4d8deafc36f6bf9a4f1ff1608778b6a9c4d1d1095b5ff08dc45b467fb9f28cf6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.6/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e19ce64ad9d504c67abb6d6fde728aea63c4769c52829feb6d832f252626f263"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.6/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2b81ffa0bca24f71b0a4cd18974966194557c0cafd555a407660be9ba9c21b74"
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
