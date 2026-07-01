class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.4.2"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.2/construct-darwin-arm64"
      sha256 "a02aa337e2de10e36369fbe7ad829a7859fed80f9dde770ef7eda1f636f46dc9"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.2/construct-darwin-x64"
      sha256 "a6133aff18b2ff60cde7d0712354bd8c81ed61c2577d3cd3eac5f14080f92008"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.2/construct-linux-arm64"
      sha256 "8212312d707d17106148880c1212c8891864140f4542fd17435a4963f2ad7973"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.2/construct-linux-x64"
      sha256 "9f8e65c85d735db1534f50a54a2eb64649f5f8e1a3f936274493c4ab6a860d56"
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
