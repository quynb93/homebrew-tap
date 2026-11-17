class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  bottle do
    root_url "https://github.com/quynb93/amux/releases/download/v0.11.8"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "af43cad408cf2175ce7bf626c69427ca06fe5c0521a5565a0548aa040ca27c8c"
    sha256 cellar: :any_skip_relocation, big_sur: "efaaa106edda9186f4f356115440ceacffa0107dd4b37fcc6a50f95abe1ccde4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1f8c01a9b592030a9188900f4d91982efabd5d3bffdbb3cd9fdf1d2a4fe3aa62"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb9ae3de4783c1b9af97fa8008b644e09efaa25837a9e184f47486cceee9b1aa"
  end

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.8/amux-aarch64-apple-darwin.tar.gz"
      sha256 "583279cc14b62b32f4ba77c1d8806c589407204098c78c8a28b50754447b5172"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.8/amux-x86_64-apple-darwin.tar.gz"
      sha256 "a0fa9bb9a2a9ef4ff45b71a5335450c0ce7357827f42641e2bc785cd2139e518"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.8/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d61e7aa1d7ea5f722e8119b7d980bc1384aa52383123a12e36d82befbfa45e41"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.8/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bd6ce8fbb4d68e53e3d2b19eaa39f4b1a6f74b14ebacaa589d2fb6f0d20ecb5a"
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
