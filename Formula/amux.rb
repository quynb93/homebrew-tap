class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.3.0/amux-aarch64-apple-darwin.tar.gz"
      sha256 "8b0b5a33f6de6b7cff23618450065b64788deaf88fd52c0629da204e7cccc2a7"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.3.0/amux-x86_64-apple-darwin.tar.gz"
      sha256 "7c927ad4c94e46b1316b7048dedf2241b144ab62f737ce40cbcdb16a7cbed350"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.3.0/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d82acec65c5e11dce4dbb800f39a629e63e42d72788bb0bd53c90b0c542d40c4"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.3.0/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "93ad86a13c3669eec2fb47593c856947bd4519d5d8d7a13087b930ccc50020ee"
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
