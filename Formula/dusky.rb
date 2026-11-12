# typed: false
# frozen_string_literal: true

class Dusky < Formula
  desc "Autonomous agent orchestrator in Rust"
  homepage "https://github.com/velos-io/getorca"
  version "0.2.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/dusky-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5fc559e8a8d3970c57666e7ddc67d0a6f9bfa74c5d76dfef4e158a3c37cc4165"
    else
      url "https://github.com/velos-io/getorca/releases/download/v#{version}/dusky-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9f2e621aa776285a561b50aea5af42f823b7bbc7d7082f938804b22878867e59"
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
