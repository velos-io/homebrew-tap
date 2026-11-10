# typed: false
# frozen_string_literal: true

class Orca < Formula
  desc "Autonomous agent orchestrator in Rust"
  homepage "https://github.com/velos-io/getorca"
  version "0.2.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/orca-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "34d8796405ce0f6a978a2f1df518aac5f75e801e0dc62e0e2fbfac9d3a57a13d"
    else
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/orca-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "34d8796405ce0f6a978a2f1df518aac5f75e801e0dc62e0e2fbfac9d3a57a13d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/orca-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34d8796405ce0f6a978a2f1df518aac5f75e801e0dc62e0e2fbfac9d3a57a13d"
    else
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/orca-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34d8796405ce0f6a978a2f1df518aac5f75e801e0dc62e0e2fbfac9d3a57a13d"
    end
  end

  def install
    bin.install "orca"
  end

  test do
    assert_match "orca", shell_output("#{bin}/orca --version")
  end
end
