class Velos < Formula
  desc "High-performance deployment compiler and orchestrator for Velos specifications"
  homepage "https://github.com/velos-io/velos"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/velos/releases/download/v#{version}/velos-darwin-arm64.tar.gz"
      sha256 "placeholder-arm64-darwin"
    else
      url "https://github.com/velos-io/velos/releases/download/v#{version}/velos-darwin-amd64.tar.gz"
      sha256 "placeholder-amd64-darwin"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/velos/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "placeholder-arm64-linux"
    else
      url "https://github.com/velos-io/velos/releases/download/v#{version}/velos-linux-amd64.tar.gz"
      sha256 "placeholder-amd64-linux"
    end
  end

  def install
    bin.install "velos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velos --version")
  end
end
