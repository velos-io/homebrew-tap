class Velos < Formula
  desc "High-performance deployment compiler and orchestrator for Velos specifications"
  homepage "https://github.com/velos-io/velos"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-arm64.tar.gz"
      sha256 "163b657e04d00dccd9236c65e3e58b8673588c23ef4e3fe35a153e7f6782761f"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-amd64.tar.gz"
      sha256 "884555da991fef58e546cb2b21e127d30d815b4852822d391b6ecb2ef9fa63ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "cd62450f629fd60c699b88312c7fc6369954df7f1df8cd5f00ea26b6d52ebb9b"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-amd64.tar.gz"
      sha256 "e06cb3e9225e4bd4b8934f55ff6dfdce12314efb3371e95ba4c8c433c2649b36"
    end
  end

  def install
    bin.install "velos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velos --version")
  end
end
