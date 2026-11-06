class Rex8s < Formula
  desc "Kubernetes in the Rex terminal: one cluster per pane, Flux built in"
  homepage "https://github.com/vitalbh/rex8s"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.1.1/rex8s_darwin_arm64.tar.gz"
      sha256 "c4f176894c820979921ee8decee381b12a7306c56cfe8a7174b9d5ea823a7c04"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.1.1/rex8s_darwin_amd64.tar.gz"
      sha256 "6500b7a34be6b7dcfc93892fce2e836c4d847c9b1f2177d23f31b8ba3595a8f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.1.1/rex8s_linux_arm64.tar.gz"
      sha256 "61ef265f3a8d48f4009e7d971ef7327258bef31775bb8696e980d143c6d947de"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.1.1/rex8s_linux_amd64.tar.gz"
      sha256 "acd4b72c1d18ee96c6660067db097b7fda7645a477afb1db891720f0de4fa01f"
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
