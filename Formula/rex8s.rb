class Rex8s < Formula
  desc "Kubernetes in the Rex terminal: one cluster per pane, Flux built in"
  homepage "https://github.com/vitalbh/rex8s"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.1/rex8s_darwin_arm64.tar.gz"
      sha256 "70334380012e6a464955157fc0dae38c193c44723269715787c158e70bd7939c"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.1/rex8s_darwin_amd64.tar.gz"
      sha256 "3623486f1190242aebb4e3123bc690fd9b6cec581f24ae07d4839c29826d68e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.1/rex8s_linux_arm64.tar.gz"
      sha256 "32892638590ef05309012f1e3a8bb362ad401e5549885b811ddfee13a26c70b1"
    end
    on_intel do
      url "https://github.com/vitalbh/rex8s/releases/download/v0.2.1/rex8s_linux_amd64.tar.gz"
      sha256 "89a3df2c3e3b9d3d2b277bf396036dffbe761378d54bbac95abfdcf64286e285"
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
