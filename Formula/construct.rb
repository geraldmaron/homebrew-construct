class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.2.1"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.1/construct-darwin-arm64"
      sha256 "89daabcfa522e53b5e7518a61bcfa1e73ca7be929be25fd7b675083678b535ca"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.1/construct-darwin-x64"
      sha256 "ab3675301d91dca0f24c080f68329dcd6e1daeccdc3c115459541b2fad132330"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.1/construct-linux-arm64"
      sha256 "0988ab2d59befcada068e823f7f9acccfc72c8712d0d180bd44a59230eb021bf"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.1/construct-linux-x64"
      sha256 "79136c0b210c0b348fc2b5e8bf731a90e078ea0cbca83f7d694711e85aca7615"
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
