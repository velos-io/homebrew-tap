class Velos < Formula
  desc "High-performance deployment compiler and orchestrator for Velos specifications"
  homepage "https://github.com/velos-io/velos"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-arm64.tar.gz"
      sha256 "2fe4dc0651b4d40f3354540f6b11c97ff9a21ac1d0d9c21842c918a42c29401e"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-amd64.tar.gz"
      sha256 "ab362d1ffa0db6b73c4e8f6a10cf6acc244fa84d4f96ac003d2a853285a7687b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "fffe3620c3a11fbb0455f425fa7df7e87be694a4666feddffe985c760c4d1d24"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-amd64.tar.gz"
      sha256 "613a94389afaa029774afcb9f0eddca8a82d2378391c3f22615fba08f92d39c4"
    end
  end

  def install
    bin.install "velos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velos --version")
  end
end
