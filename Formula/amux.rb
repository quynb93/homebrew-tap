class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  bottle do
    root_url "https://github.com/quynb93/amux/releases/download/v0.11.12"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "fe5a9a833063ca4277910ec525c34eb0e0280e3c5896d5e8cab53984110a95ef"
    sha256 cellar: :any_skip_relocation, big_sur: "1a1795211b8842f0c9d428c139608a59444e5befc12c6bf4946bdabf8110b594"
    sha256 cellar: :any_skip_relocation, arm64_linux: "16e43ea23d42a09a1c889339e8596dc695e9e66276e33bf6255a1b19c3acab69"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5d01e287f74e6e383aeadbe623a494d981bcea3a0cb7cfdcbaa21fa09ffff3e6"
  end

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.12/amux-aarch64-apple-darwin.tar.gz"
      sha256 "786fe196c0c84fec3c4146ae3bbcf0148028ae69e6470ff820a3d317b5755df2"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.12/amux-x86_64-apple-darwin.tar.gz"
      sha256 "4e6a57d1da5fc490128ca2d0fd16153bf74575e47051def83266e5350ebb67b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.12/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a09317545644d76fb311b011901db2e888047d33364132d597e3fed6abd38a8c"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.12/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5d78b8cf48ddd322ccb53b8bd94d3521ff43b311bfce866aae0c3fd459e38dd9"
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
