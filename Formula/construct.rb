class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.16"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.16/construct-darwin-arm64"
      sha256 "727414b982c70c115b4ff1f7adbca0dbfa78f0b0ed75a8bae301b7dce586bcfe"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.16/construct-darwin-x64"
      sha256 "e5755e546fb67af5bb45b7695d08f3e5e6d06d8fd3cbfa3c7bc1aaf80604578c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.16/construct-linux-arm64"
      sha256 "91c2c380753c50d1f3af22462432a866fa7bf496951dda1eed753bac4c28bc95"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.16/construct-linux-x64"
      sha256 "31ad328d1bae51e7980283e6054eb295022959a6454f11b6d43378f721aacce2"
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
