# typed: false
# frozen_string_literal: true

class Orca < Formula
  desc "Autonomous agent orchestrator in Rust"
  homepage "https://github.com/velos-io/getorca"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/orca-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "052682d65b4cc1e99e563a61676b314566bdddc2147087ab82105b5c1f6c476a"
    else
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/orca-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "052682d65b4cc1e99e563a61676b314566bdddc2147087ab82105b5c1f6c476a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/orca-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "052682d65b4cc1e99e563a61676b314566bdddc2147087ab82105b5c1f6c476a"
    else
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/orca-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "052682d65b4cc1e99e563a61676b314566bdddc2147087ab82105b5c1f6c476a"
    end
  end

  def install
    bin.install "orca"
  end

  test do
    assert_match "orca", shell_output("#{bin}/orca --version")
  end
end
