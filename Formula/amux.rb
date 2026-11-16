class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.5.1/amux-aarch64-apple-darwin.tar.gz"
      sha256 "b7cfcf4b16a54157c2c8883184294f63634c23275dcc024a7b9300389e20fef1"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.5.1/amux-x86_64-apple-darwin.tar.gz"
      sha256 "e659a7169769e01df06ee52532ba91f299da5e7083af18848f6e81d54ca71a33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.5.1/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bf9bf6be060ed270d342f694925a82a85e4d1fa772b71a719c93f41379db056e"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.5.1/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7900f14099900226b0d45e7489d4262f1da2fe6682285918b2c859605894dea8"
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
