class Velos < Formula
  desc "High-performance deployment compiler and orchestrator for Velos specifications"
  homepage "https://github.com/velos-io/velos"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-arm64.tar.gz"
      sha256 "fd1d9be0425de77b7edffde360236a0f2b31b4648f246726c044b40e1fcbac97"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-amd64.tar.gz"
      sha256 "57f6f9199f11f74d65fc54c52ec8da34506b2334a9f56ec0ba6784f6a2c127bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "4ffb57f91825013f20d00c69767ddc95edb2e993cd84e8873c9e930fa92d25e8"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-amd64.tar.gz"
      sha256 "d007257d5c84a93a8c2a5b30a7044bdb4365a29fb94aaf9c80884dcd22afed7b"
    end
  end

  def install
    bin.install "velos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velos --version")
  end
end
