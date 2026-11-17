class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.0/amux-aarch64-apple-darwin.tar.gz"
      sha256 "8974d1b4d0333d834830f2c8505bab637ab4106438169208c43bd1e5326b2ea3"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.0/amux-x86_64-apple-darwin.tar.gz"
      sha256 "49a5b5a45ed85cf4b78afa555229537f1fa4cf7865c2c6b8d250295774c6c7c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.0/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "746129f5b59a4b25e829acc2a92e876b9a341bd3bdc4230f2911a634858a04a7"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.0/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2118af21b824238c7884547a8dc10fbc2f0c225f1fbed524a034312ec64249ee"
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
