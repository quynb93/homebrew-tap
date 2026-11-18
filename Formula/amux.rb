class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  bottle do
    root_url "https://github.com/quynb93/amux/releases/download/v0.11.9"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "5dbf5d974b8bc01aefa158ef21b1b881e0d1bc5f12ba86abbcc4a64259edca1b"
    sha256 cellar: :any_skip_relocation, big_sur: "e3a6eeb0e469bcfc6cf1f9d55e00c26bf1213b5a70e4ff79dcdf3127e91ee753"
    sha256 cellar: :any_skip_relocation, arm64_linux: "bc2845b68ea4975e25fb8d7f953512bee91c281bbeed253f42d9e127b981e148"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "00d3f6f1f784c77eff87c90924af2047b94c7081ff11eb17089544762064bc8a"
  end

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.9/amux-aarch64-apple-darwin.tar.gz"
      sha256 "95be08c3a802d37867dc79be347dc4de3b2cef147aca1ddf5d0a28a957ed2753"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.9/amux-x86_64-apple-darwin.tar.gz"
      sha256 "d72cf5f3c103455e1ef50165196f2e085c5ec6d2b5fb83c379011f5e86cf1ac6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.9/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2431054493fb20823e4b5e2e3fde3129fa17de71de68268cea4cd376c44e7ad0"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.9/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9589324a8f2165189eb60ed0f7e090a6e971da0e1403d12def96cc2264bae46e"
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
