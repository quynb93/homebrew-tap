class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  bottle do
    root_url "https://github.com/quynb93/amux/releases/download/v0.11.14"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "cbcf0ff6153df7db3dbeb6fec310c7a5582cd4676d9423d1fc070c5c28bfb6f0"
    sha256 cellar: :any_skip_relocation, big_sur: "b165262d8937b7b31646da86385d1bd8bd442e81c6261cd210c403ef529819dc"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1c998b349db991c6969e75221658e4867c38268cb77014419dc43df3f5addacf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2cf4a9ce2d63229e393a1c580bcf65a15e9e8fcd73b7ca19aac3afe0cf6c887a"
  end

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.14/amux-aarch64-apple-darwin.tar.gz"
      sha256 "9ce5f601a214f8e11a87459c006772ced6f18c2c223c91e9a94d7bcde211fbe2"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.14/amux-x86_64-apple-darwin.tar.gz"
      sha256 "e35da5f74c8eed803d20a7eef0a353ae51ea19c90415b17d74199e59b0a6001b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.14/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c411db2815e806669be39f72f3c5bdc6f4e9d6d1b9cc3486128eebcf6cd30485"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.14/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f3095c88b7bd1760717cb4c935bb6147e6c92a81ea67cc1adc1a3edda2751116"
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
