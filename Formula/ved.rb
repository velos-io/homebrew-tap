class Ved < Formula
  desc "High-performance deployment compiler and orchestrator for Ved specifications"
  homepage "https://github.com/velos-io/ved"
  version "0.2.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-arm64.tar.gz"
      sha256 "55ed70ed116d0ef49827c2abda181a5fd798f0a5dd134054bafae56fbe9437fe"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-darwin-amd64.tar.gz"
      sha256 "01a1cb5e4a56818af545bf055fd38802e35af97d00edba5217cbd94820da4720"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-arm64.tar.gz"
      sha256 "56563dfe45a285b323531f79a9b1207900c3d8b098b18a3aa234b0214524e44c"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/ved-linux-amd64.tar.gz"
      sha256 "01eef526a851618d198a7563a88000e4275afc66be0ee37194c27ae4b852b160"
    end
  end

  def install
    bin.install "ved"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ved --version")
  end
end
