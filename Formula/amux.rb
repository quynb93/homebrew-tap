class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.8.0/amux-aarch64-apple-darwin.tar.gz"
      sha256 "a31a198ff194cdd2a15d37334bdb53f2b15e0a1afbc23c8301c44733e453eefa"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.8.0/amux-x86_64-apple-darwin.tar.gz"
      sha256 "6544db9a40060725a3ea86df04f733fbf30af0492e1101d2edcac0764c6d0ba9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.8.0/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f171e5dd3f5764ac876763abe6453e9e810299bd7c1403261eeaebda385872e5"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.8.0/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3b5cca26da194497f9647a58f6e744b018923366a5623a6906a666559af61f1e"
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
