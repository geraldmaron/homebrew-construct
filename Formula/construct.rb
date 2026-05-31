class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.14"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.14/construct-darwin-arm64"
      sha256 "bcf05a7d292cf237d990fcead5dcddfc23d9cf5673f7354b038fdcff42f0b13a"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.14/construct-darwin-x64"
      sha256 "c4c926c0fe4546d5d4dd654ac8cd0f0ff5950cd44a3bfaf3bc18939d03d7cae8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.14/construct-linux-arm64"
      sha256 "46733483ab08efb8820036be78e8bc0c43d2bcf9f6c0ffd51f1143c7d1b7342b"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.14/construct-linux-x64"
      sha256 "22714c0da263f261ec590bc56e29bceb27d87984e0ad92e432b05a2271c24a5c"
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
