class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.1.0"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.1.0/construct-darwin-arm64"
      sha256 "7737e95d153532e58ced8182172489240a00fdbf98cdeffafcd20b9899fa1f10"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.1.0/construct-darwin-x64"
      sha256 "1d611afa4d9754f00ac9e90a39bfa5eca85c16e0e154f4216138e08d8dafd5c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.1.0/construct-linux-arm64"
      sha256 "047212737c5ce4e8f6d95ff53cbe9cdc70c240166738cfec9c343914507d92da"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.1.0/construct-linux-x64"
      sha256 "01aa24e9b419b59fda8a67a478ac4515e2fd9dc4c6361024b85e22b59e4ce30b"
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
