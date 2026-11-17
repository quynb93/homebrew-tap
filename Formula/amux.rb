class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.4/amux-aarch64-apple-darwin.tar.gz"
      sha256 "8f086f1d0e4f2d155866d0bbcd01b0aa0394105922e1c41016aaec7962a9440d"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.4/amux-x86_64-apple-darwin.tar.gz"
      sha256 "336a3900d245aa71e53d6c8a8952d0a0f7188a457a358de25e1a1cd27a573390"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.4/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3d780a071aaea7dabfdf82bba9aabc7272d957e428c7b92bb4706c856f2c5d3b"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.4/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5fa100b38d97873157ad204f04fe7f06833970a7c33d68767a1a902e1a2fc1df"
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
