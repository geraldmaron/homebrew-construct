class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.6"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.6/construct-darwin-arm64"
      sha256 "7b60f7feef3a732ead760aeee96689d9cae9fc48637f70eb3b314b14b7d98490"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.6/construct-darwin-x64"
      sha256 "beac1dfbb1cf228ae845083f1aac6efb4a266dffb3ea9fd9f1175bf41f5d2a4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.6/construct-linux-arm64"
      sha256 "76e36d757208ece97cb96bc94d9cf42100625ec3a743ff246fd6cffa90fbfcb4"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.6/construct-linux-x64"
      sha256 "56a2b7fcca93893988c068a8c0d4e6117a76be4b43e82206d8dca8a1b3655a07"
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
