# typed: false
# frozen_string_literal: true

class Dusky < Formula
  desc "Autonomous agent orchestrator in Rust"
  homepage "https://github.com/velos-io/dusky"
  version "0.2.25"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/dusky/releases/download/v#{version}/dusky-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f07eeb00fa93e59c2c43c1f8a358598ce60bc21fa57ce8cbb4a51208e866dfc3"
    else
      odie "No Dusky binary is published for x86_64-apple-darwin in this release"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      odie "No Dusky binary is published for aarch64-unknown-linux-gnu in this release"
    else
      odie "No Dusky binary is published for x86_64-unknown-linux-gnu in this release"
    end
  end

  def install
    bin.install "dusky"
  end

  test do
    assert_match "dusky", shell_output("#{bin}/dusky --version")
  end
end
