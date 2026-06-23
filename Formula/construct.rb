class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.2.0"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.0/construct-darwin-arm64"
      sha256 "ef97a37f4672314a5c29d2c84101f463453c75e5499da41abbd67bd33d643251"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.0/construct-darwin-x64"
      sha256 "1f63d135a414cd6e2af316e1647f4d46d4ccb7e28fef9071cf8833d725b1b17b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.0/construct-linux-arm64"
      sha256 "9229e2896ab34cd7bf0ebb26bcacc65e59fad880f7062bc24edf4c33e4b277a9"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.0/construct-linux-x64"
      sha256 "bf0870cb47ee682fa2e902b624a2c9e0b47809399109996aaa5f6f4edb49fab1"
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
