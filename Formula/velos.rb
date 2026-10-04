class Velos < Formula
  desc "High-performance deployment compiler and orchestrator for Velos specifications"
  homepage "https://github.com/velos-io/velos"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-arm64.tar.gz"
      sha256 "0548969e34e12a7d21c39c8c17ac4910a138e7e8ea694525b8efe5f651b9fc0a"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-darwin-amd64.tar.gz"
      sha256 "a89ee38f58b0c1425f3efec234963deb13f5721715189ac9618d1af81b1e79ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "fbb36ee6bab28f7360d668115ca5b8ba36a3b3ec53f7d3e94f0df1893e9b28e6"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/velos-linux-amd64.tar.gz"
      sha256 "365fed5b38538f814f7cbb39e944ee26d848b9233461c6b597cd40c03331ef2e"
    end
  end

  def install
    bin.install "velos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velos --version")
  end
end
