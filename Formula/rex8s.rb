class Rex8s < Formula
  desc "Kubernetes in the Rex terminal: one cluster per pane, Flux built in"
  homepage "https://github.com/vitalbh/rex8s"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.2/rex8s_darwin_arm64.tar.gz"
      sha256 "acb210892e21d39dd79ea57df5e6c66c05533910f445b1777f55c7d3fc10a1c5"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.2/rex8s_darwin_amd64.tar.gz"
      sha256 "9192837b08149c8a0b12c2d9274e3668d50f6ea1366e09c412fe4276a7fb4d34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.2/rex8s_linux_arm64.tar.gz"
      sha256 "03304940f868add0af47caa1c8dea9f9e703d874396fe500761d4ed647578ba6"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.2/rex8s_linux_amd64.tar.gz"
      sha256 "9d952ab201fac0ce3983c2c4bb2cade4a40c26a0877c2343f575be0753a9c7a9"
    end
  end

  def install
    bin.install "rex8s", "rex8s-guard"
  end

  def caveats
    <<~EOS
      Install it into Rex (the k* commands, rex8s.lua and require("rex8s")):
        rex8s setup
      Then rex8s doctor checks everything. After brew upgrade rex8s, run
      rex8s setup again when rex8s doctor says rex8s.lua is outdated.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rex8s version")
  end
end
