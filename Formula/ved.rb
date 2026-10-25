class Ved < Formula
  desc "High-performance deployment compiler and orchestrator for Ved specifications"
  homepage "https://github.com/velos-io/ved"
  version "0.2.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-arm64.tar.gz"
      sha256 "cc96d676fa2e262e49706743169c542b3fff0438d89fed517e04c40e94d9cdc5"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-amd64.tar.gz"
      sha256 "506507f31b63403a839cbb04aa268fbfb22a0b86d0fc942c50777932ccebd88f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-arm64.tar.gz"
      sha256 "fc29d53e690daef10069b01aed4264123f34a7840d70a1994463868988c0e24d"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-amd64.tar.gz"
      sha256 "0052a56f6b64b389cbc8f3447ba1cf9ba0375e56f77573e1f4d3c32c7582da81"
    end
  end

  def install
    bin.install "ved"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ved --version")
  end
end
