class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.5.0/amux-aarch64-apple-darwin.tar.gz"
      sha256 "a4e47f2f11ee34cc9fc28942f9aaa28e004b29e80f0ac8046df512bda434ba48"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.5.0/amux-x86_64-apple-darwin.tar.gz"
      sha256 "91b99861cca602cea9c8d956af5beafd5476ee81c6951f8719649e404691294c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.5.0/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9bdb7046b3ea88bbe4e4dc6ac07e7218d65f769c21d332f37bc62dc75fb29e9e"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.5.0/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f8e3cfa180f5e67731e23fa86a4f7b1c35e82426edd8e34d6bd1ca683b78b819"
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
