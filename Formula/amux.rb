class Amux < Formula
  desc "Run Claude Code, Codex and Gemini CLI with many accounts over one shared home"
  homepage "https://github.com/quynb93/amux"
  license "MIT"

  bottle do
    root_url "https://github.com/quynb93/amux/releases/download/v0.11.10"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "c706b175d93fc70651c145a380262f9ed765aca80df21d99e1eef61181b80f0d"
    sha256 cellar: :any_skip_relocation, big_sur: "2bdba7b491712928ee00143edc92a6a02535bf66de4ec98882c8112cdb441b20"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6f0e811eae4492f797ffb5dc685dcfca26c8887857ac40b6d4eab83f109edf9c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "60f44661485c6baf1af6d63864b6e21c9f0f6fff2d0bf4c5d0e302ed95a1e5cc"
  end

  on_macos do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.10/amux-aarch64-apple-darwin.tar.gz"
      sha256 "0c3cb1d87df998eaf7626b65b54224dcd7419e19eea2d6b2c65e5adb980d7d15"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.10/amux-x86_64-apple-darwin.tar.gz"
      sha256 "7ee35805ce9c900ff10db6662a90ef52e2b316cc2afd1c847f048fea00f36ce7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quynb93/amux/releases/download/v0.11.10/amux-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dfcbef71911b3894498cd6a21dc4f472dfd42af3bc9e4d1463a732e21a1ef539"
    end
    on_intel do
      url "https://github.com/quynb93/amux/releases/download/v0.11.10/amux-x86_64-unknown-linux-musl.tar.gz"
      sha256 "93da3b7b752054a5f51ed2c0f8b8c491a3a2e8cd7f2d2d13a1435cd845c4e1cb"
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
