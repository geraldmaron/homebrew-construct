class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.2.2"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.2/construct-darwin-arm64"
      sha256 "43c211bdd76ff3a7aa0d0272e23028013d40443ca2142cfb41be46fc945f7de8"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.2/construct-darwin-x64"
      sha256 "6c20adbcb5600f97e712e929ba7e04cb82f38dfae0ab853af973859109505759"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.2/construct-linux-arm64"
      sha256 "0d279589737ce33d78ea958355fc372ded7d9daca1029b5512799fac8b64a694"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.2/construct-linux-x64"
      sha256 "79022a3c04a80310e9821f8ab4c20c75f2a021b2f848505aa4fc7146bb35c6cf"
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
