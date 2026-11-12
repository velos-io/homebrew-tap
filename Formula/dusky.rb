# typed: false
# frozen_string_literal: true

class Dusky < Formula
  desc "Autonomous agent orchestrator in Rust"
  homepage "https://github.com/velos-io/dusky"
  version "0.2.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/dusky/releases/download/v#{version}/dusky-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b556097302d7c4141a4611ee7b65706df0a7791642220bd86a5b95868b5df8e4"
    else
      url "https://github.com/velos-io/dusky/releases/download/v#{version}/dusky-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f9ad7d8f144c1e69eec4e5f2fda58faa150c1179eb1c9d3da631fe8f2e90c354"
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
