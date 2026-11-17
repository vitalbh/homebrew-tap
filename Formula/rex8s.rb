class Rex8s < Formula
  desc "Kubernetes in the Rex terminal: one cluster per pane, Flux built in"
  homepage "https://github.com/vitalbh/rex8s"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.0/rex8s_darwin_arm64.tar.gz"
      sha256 "2b3a59be335d0e351fd8e34dcca5a5f3e4461991cf2e25d89e6e672dc47505b0"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.0/rex8s_darwin_amd64.tar.gz"
      sha256 "c408180ffd812dab52881e506aca0c3a2ef1028b139c5b4513a68f73b1b6f34d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.0/rex8s_linux_arm64.tar.gz"
      sha256 "8d19a200b87fc33630c423e316a0dc0ead821fe80e5de1571c653ec874f68f22"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.0/rex8s_linux_amd64.tar.gz"
      sha256 "fdd3ecb165d10ccc99f0da42cb53e3465b774fdf1287ae5dda2bfc1ba7ac7d0c"
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
