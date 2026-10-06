class Ved < Formula
  desc "High-performance deployment compiler and orchestrator for Ved specifications"
  homepage "https://github.com/velos-io/ved"
  version "0.1.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-arm64.tar.gz"
      sha256 "95c61322bfc21710d9f65523ba21ff95a84833d21daf98b98a7123eac8c87a40"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-amd64.tar.gz"
      sha256 "84a5605b28552806f6c10fb0ebd6654ee856b58b5a05ac07cfcb8159f22411a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-arm64.tar.gz"
      sha256 "e50d0a118e6a70e15312c9d1dcc1a833735c72de638a68ddf26e106a3dc18557"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-amd64.tar.gz"
      sha256 "b10e04180359893b0d690382e5ad07ee4bd62b17c9d73a38fc7c2959c5886885"
    end
  end

  def install
    bin.install "ved"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ved --version")
  end
end
