class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.2/amux-aarch64-apple-darwin.tar.gz"
      sha256 "753287a7212f17db4e3f2b36ab6800bd7bb990032eddaa451555377cb188879c"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.2/amux-x86_64-apple-darwin.tar.gz"
      sha256 "1870f3f3af3915c3c6a2af93d4314a4c9f755c3d4fb24bf0d30d92921e46e0f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.2/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8b9b8e4c5d3883a0585f5b8603b40e2002824ff1fa604ede76da3d5c566e1d1e"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.2/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "47e1b1173cf690e64e0c507d2d592ea69482d23fa724caa3362a1d9206208a1c"
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
