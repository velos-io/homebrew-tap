class Ved < Formula
  desc "High-performance deployment compiler and orchestrator for Ved specifications"
  homepage "https://github.com/velos-io/ved"
  version "0.2.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-arm64.tar.gz"
      sha256 "793ccaa1479c16d1376f78543756bdda873a11c44e7687ce7ae9aba6c5b25047"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-amd64.tar.gz"
      sha256 "74cfdd2adf93df56eb5a3ff3232a75f33329b4508b2b03d59fc9d49ecd530c77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-arm64.tar.gz"
      sha256 "b981f71912d6210124a3d21d01fc329d6fa4ee8dd03121131013979d4027039c"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-amd64.tar.gz"
      sha256 "1cf978ba1b35b52e61abb273c12f4171a7975595299a5a75b3f7af2a4691ba31"
    end
  end

  def install
    bin.install "ved"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ved --version")
  end
end
