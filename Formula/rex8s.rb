class Rex8s < Formula
  desc "Kubernetes in the Rex terminal: one cluster per pane, Flux built in"
  homepage "https://github.com/vitalbh/rex8s"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.3/rex8s_darwin_arm64.tar.gz"
      sha256 "27591d297b0be6792610e4dfaefff135edf93d53df10843d13672dd8f5668e2a"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.3/rex8s_darwin_amd64.tar.gz"
      sha256 "e93328461a3abe7bc81f5a10ed031b9f40bfae95ec135b3c709a75227c58fefc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.3/rex8s_linux_arm64.tar.gz"
      sha256 "7a4b5adb43f463f1771295a2729012790f1174c315892c69f6dd858b2af9d5b8"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.3/rex8s_linux_amd64.tar.gz"
      sha256 "c7064353000de5f688c140b933da77dd8939556a1ce727995b20013ed0b15ffd"
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
