class Rex8s < Formula
  desc "Kubernetes in the Rex terminal: one cluster per pane, Flux built in"
  homepage "https://github.com/vitalbh/rex8s"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.1.1/rex8s_darwin_arm64.tar.gz"
      sha256 "2c59b9cfec3afe79f606416e7358720290bbac435b52263fff15849898333ece"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.1.1/rex8s_darwin_amd64.tar.gz"
      sha256 "3c958ab3838f399a90382c7810bcaf85f8fa43607fb4f7266a1f3966b40d635a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.1.1/rex8s_linux_arm64.tar.gz"
      sha256 "4c801850d38dcc6533066fab95e023b628acb5b80eb71fafb6a77b30e84e402e"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.1.1/rex8s_linux_amd64.tar.gz"
      sha256 "31cf12b30f1020d580b2097411e761a8a17064659a8a9671016b3120b79d1233"
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
