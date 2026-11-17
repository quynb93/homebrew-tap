class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.5/amux-aarch64-apple-darwin.tar.gz"
      sha256 "1782e99ed6258af33e6795c7e4dfd6f0e0f34fa3477bfadbf5dba9cf99cc980f"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.5/amux-x86_64-apple-darwin.tar.gz"
      sha256 "4cc54432253c05ca57ef86a669cabbece22c3bbb69cff79c7fbe44ec35907132"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.5/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fc75fce66d4bb2d241b149993289946cf66e17d0f7ccb8181faddb30ba8cb89d"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.5/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d352a35d9a6283c084c15314c200ab7c25f42b6f21fe58aadd57b8f0465f9eb4"
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
