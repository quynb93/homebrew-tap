class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.2.1/amux-aarch64-apple-darwin.tar.gz"
      sha256 "f61dc065e9d3798ee8796cb217bd7455eb8aeb6593081db1e5b20b66014a7953"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.2.1/amux-x86_64-apple-darwin.tar.gz"
      sha256 "29bbbd473cb3ac9164e581efa3bfe2f6942e6803f7c71671b0e47437ebe31c50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.2.1/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8fa339152f5b386152ab046271f86bb0bc2be89a9c0c91e4eeeaac428e1fecd9"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.2.1/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5e3c0a96f3cd57fdca20c841c4636b2a50a46efa53c8ceddb5be81055cc044d8"
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
