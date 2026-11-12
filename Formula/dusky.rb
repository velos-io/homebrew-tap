# typed: false
# frozen_string_literal: true

class Dusky < Formula
  desc "Autonomous agent orchestrator in Rust"
  homepage "https://github.com/velos-io/dusky"
  version "0.2.22"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/dusky/releases/download/v#{version}/dusky-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c7b234a0a96c3223f446b55b58579ebad397b5d7ff14178cfd432c55020a42f5"
    else
      url "https://github.com/velos-io/dusky/releases/download/v#{version}/dusky-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ea1ac3159051398e143ea44f4871c50a3fad1785eff49bdbfea21f09a4d37464"
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
