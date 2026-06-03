class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.21"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.21/construct-darwin-arm64"
      sha256 "47bcd998b439f8b6461998bd85dc4ce9e296f4156c760be0c5fc5cb9683a8768"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.21/construct-darwin-x64"
      sha256 "70015c0c3c1e959830c72311550374f8684fc74decd4ebf90b8212f8420ea707"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.21/construct-linux-arm64"
      sha256 "222f6962a4e82ae1d6c47a371366c5a848366fd840b7a6e08ebc7570eb21ff96"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.21/construct-linux-x64"
      sha256 "2c43b8fc02443dc82c63a14e8038df7c5256d57a5dea295ba7023e1bb14f32ae"
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
