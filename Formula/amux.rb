class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.3/amux-aarch64-apple-darwin.tar.gz"
      sha256 "58f395428bf5fdd0de24dccbcbe7acfd0bda1a425c80a311aa8ce1f84d4dd1d7"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.3/amux-x86_64-apple-darwin.tar.gz"
      sha256 "f010d765e6fa9eaee6057e0a9150f335f7d5b9d7a67aa9bdd99979832fbe130d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.3/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a52cd5edcd97764b8c50d4fe6301a1eb1cb514f39932ffdb95236ac819b256ae"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.3/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "daf380d6cc91ed4da49906edd1990c6598018f99be5cbff20a8c5bc7e5835a7b"
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
