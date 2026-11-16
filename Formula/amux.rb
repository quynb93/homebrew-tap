class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.6.1/amux-aarch64-apple-darwin.tar.gz"
      sha256 "1241da7abc140195e197fb3a4e746ddbf8cc895528a9194c52e813d423a7eeb3"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.6.1/amux-x86_64-apple-darwin.tar.gz"
      sha256 "25b5545548b34d6a39eb8cfaae18a20579ff6f6cc7907069a68c5dfeb160269c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.6.1/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "605d463a69b98310b21794debc2957a2045c1c52bfd591ebea437d969e3543c5"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.6.1/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1bd397b9bd85922fbf2c04427867a37b0fe1884cc6d4dbc4d98ea7edf215c9cd"
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
