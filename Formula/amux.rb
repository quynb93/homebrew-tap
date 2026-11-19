class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  bottle do
    root_url "https://github.com/quynb93/amux/releases/download/v0.11.13"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "faa95a115403e4ac7668549f924748582bcb06ab273a3de60019954cb94d4510"
    sha256 cellar: :any_skip_relocation, big_sur: "1f87d4ff4e6744d97b2060f05477315f7cb7456e0f9a916089f16d767f200fd3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "7d55159053455b71e845a10bfd64b14be604ddf6de11d7925a9e873fe458ef9d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2067d4faf8f943e23d572070b529354fe21e252b2e84bbd73d0aed9d10b25190"
  end

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.13/amux-aarch64-apple-darwin.tar.gz"
      sha256 "c5eb6e6ed8a2039f6e449768eda196c01987db2ef10b1425fed612294948d365"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.13/amux-x86_64-apple-darwin.tar.gz"
      sha256 "cb353e0bdeca6478add39b10ad3a77e274e03f6b8d58baad1b0d6a511a817388"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.13/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "05ff3c165c458cf503bf72eb3a637fd45c9b4ad60f4cc24ea0fcd39b27555cff"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.13/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "73070ba8527205e3aa8d80722fa6b5781a31169413b017d0ae7e329b05914aea"
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
