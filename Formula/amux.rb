class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.10.0/amux-aarch64-apple-darwin.tar.gz"
      sha256 "bfb9e638f1f1758d0469766bafb769c7e32d122af6658d1eccdd8d6a4c8ae169"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.10.0/amux-x86_64-apple-darwin.tar.gz"
      sha256 "0d02463790dc83e85ab8d3a39d18c26c16f7098c6c92e9918ef46a348c7bc387"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.10.0/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4be82307a83274c6be9a540b151f9439260666ea825751367ef8de02f5dd43c4"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.10.0/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "36155b89039e5138ab74ef0e5252dc23108a674363b7b08255722b514e66f263"
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
