class Velos < Formula
  desc "High-performance deployment compiler and orchestrator for Velos specifications"
  homepage "https://github.com/velos-io/velos"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-arm64.tar.gz"
      sha256 "3e97f21a761236ad8ff82ef0a51d3b053a022d9825c4b9a18b46ca3618d97245"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-amd64.tar.gz"
      sha256 "e4c05aa3bf6e351713d061dc8d3fe9f7e3fd66340de61b5c460941653c1ee527"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "c145ebaf6b262b6a5d2545578dd4a70269880335026402d13f74c99255b1db59"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-amd64.tar.gz"
      sha256 "5de33b67b75cb291fa6eafdb5a3080d4c55f16f4d3552632d5696b56b5ed62cf"
    end
  end

  def install
    bin.install "velos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velos --version")
  end
end
