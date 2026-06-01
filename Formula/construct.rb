class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.15"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.15/construct-darwin-arm64"
      sha256 "f52043b5371545d0a923004ba8a9a2b96fefb9725c1d0288fa42b025d73d8051"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.15/construct-darwin-x64"
      sha256 "24979d99a1acd990e7b8c173d5fe82a0bde23a9bdf72b0f6218bbee0a87a1bc2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.15/construct-linux-arm64"
      sha256 "56cb3b816369f56982166c3bd7d5a6bad7c6a1c00f54c575413a6445143e135f"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.15/construct-linux-x64"
      sha256 "750fbabd7b011c38be2fa956417b283a8d70e6987aff461dc74d2e1328ec036a"
    end
  end

  def install
    bin.install Dir["construct-*"].first => "construct"
  end

  def caveats
    <<~EOS
      To finish setup on this machine, run:
        construct setup

      Construct uses a local Postgres container (via Docker) for hybrid
      retrieval. If Docker is not installed, Construct falls back to a JSON
      vector index — no hard requirement.

      To wire up hooks and agents per project, add Construct as a dev
      dependency in that project:
        npm install -D @geraldmaron/construct
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/construct version")
  end
end
