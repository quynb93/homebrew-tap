class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  url "https://github.com/quynb93/amux/releases/download/v0.1.2/amux.tgz"
  sha256 "7ad3f6812bfaefd0526e9ea9d0fafb181e7d193af34759570da652b84d4f30a6"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/amux --version")

    ENV["AMUX_HOME"] = testpath/".amux"
    ENV["AMUX_NO_UPDATE_CHECK"] = "1"
    assert_match "No accounts yet", shell_output("#{bin}/amux account list")
  end
end
