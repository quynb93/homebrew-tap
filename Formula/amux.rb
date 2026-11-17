class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.9.0/amux-aarch64-apple-darwin.tar.gz"
      sha256 "4af363de851b7ecd1141a005eb4d7a40efeb75119010eaecb327a43bb4b86a24"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.9.0/amux-x86_64-apple-darwin.tar.gz"
      sha256 "421f6d7b0da7405c2929c4f60977477840a9ad20edea72a4f970c28c2ac34290"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.9.0/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1bc27464df64246c6d1c3edda1ded5552e55cec22a4ad6d89ab3f4ea3f4a0f54"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.9.0/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e39405f56a63be37c593138211e2920aba802a008176bb3b45bea6d22a374477"
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
