# typed: false
# frozen_string_literal: true

class Orca < Formula
  desc "Autonomous agent orchestrator in Rust"
  homepage "https://github.com/velos-io/agent-orc"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/orca-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "106d5417287e408bf93a08c027514dc419c29eae8fab1b30ec57be53510cff10"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/orca-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "106d5417287e408bf93a08c027514dc419c29eae8fab1b30ec57be53510cff10"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/orca-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "106d5417287e408bf93a08c027514dc419c29eae8fab1b30ec57be53510cff10"
    else
      url "https://github.com/velos-io/homebrew-tap/releases/download/v#{version}/orca-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "106d5417287e408bf93a08c027514dc419c29eae8fab1b30ec57be53510cff10"
    end
  end

  def install
    bin.install "orca"
  end

  test do
    assert_match "orca", shell_output("#{bin}/orca --version")
  end
end
