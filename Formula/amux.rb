class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.7/amux-aarch64-apple-darwin.tar.gz"
      sha256 "86262eb77563ab2f74f679e5325aadf6ae52562825d8d540e591df5bbb4a8398"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.7/amux-x86_64-apple-darwin.tar.gz"
      sha256 "aa0f0d4d25e5a31a671645d102a38463b9313e8fa3ae02f0b286df1e6a9e7690"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.7/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f855c613fa60b087c6591bdbd833f600549cbc8aebdc7792f1a02b214a356662"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.7/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b3e70c242a6c7bb42479b526584563f576e8af1c4f492b44e5461abbde94ad9f"
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
