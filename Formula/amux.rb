class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.1/amux-aarch64-apple-darwin.tar.gz"
      sha256 "ee2caf196bc9983241142ff63babbb273312dc59876dd0b5c29be1bc5e895166"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.1/amux-x86_64-apple-darwin.tar.gz"
      sha256 "08e3f856cd34262de69aa838c691cfa75e0471154b3f3be2081d9ae23cb31182"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.1/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "260548ee128f7437d7eb6ae3611533ddfa9da7d0aeb3a3cb6523b51ae247ef40"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.1/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7dd103f82268527a2cc3890990a1b1e098d44a6c635d160a74bbb26138dca666"
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
