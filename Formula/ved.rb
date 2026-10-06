class Ved < Formula
  desc "High-performance deployment compiler and orchestrator for Ved specifications"
  homepage "https://github.com/velos-io/ved"
  version "0.1.16"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-arm64.tar.gz"
      sha256 "b270fc77233c0cc83b8e71890d59f9b2420702d86f594f39d17ecf4248f23655"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-amd64.tar.gz"
      sha256 "31496c011c00c4ca1162bdc9e00ebe82702b407e8cba5022608bbd15ce63a8c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-arm64.tar.gz"
      sha256 "3a1c2e685116c508e3dc398c36e2a8bb729cbbc0b5ae685d4bc97ecf8ba9f846"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-amd64.tar.gz"
      sha256 "38bbec23c27a23e749aa065804b784fdef7cd8e422766391cf6c70cf89348467"
    end
  end

  def install
    bin.install "ved"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ved --version")
  end
end
