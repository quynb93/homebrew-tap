class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.4.0/amux-aarch64-apple-darwin.tar.gz"
      sha256 "eeab8741e05acddb6a81edc8527bb2ce0b9b68650354d3a54ee5deae20aea371"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.4.0/amux-x86_64-apple-darwin.tar.gz"
      sha256 "37867ca1a2fc81a00050ae32e5e0ace4beba74a8e3310af6888f4d7140e32552"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.4.0/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6b41258d714922083168cabfef509c8ee287e24f365af07a9d8772370a73554e"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.4.0/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7e1b6e0d0ac56658355d20f7d7a5882907c909c00bf544b5e58bd6bff19e0259"
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
