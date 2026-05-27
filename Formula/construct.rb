class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.7"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.7/construct-darwin-arm64"
      sha256 "8b5566e3590314aff6933976a6dcc3efc886e6dbfaf57f6c68629edd0e2c6194"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.7/construct-darwin-x64"
      sha256 "29a1bcb5778c073158c9c617b5bf3974491be2803e06664af90fa01bdb74c71c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.7/construct-linux-arm64"
      sha256 "9f4eac4dcc8c0eb5934b1675994ff0aedc4855f0959d83427ffbc20e5270400d"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.7/construct-linux-x64"
      sha256 "6617ac033fd1fbb01d35dd8a306f19262a6d67a04021dbb662158533a83164a4"
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
