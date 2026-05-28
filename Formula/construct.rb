class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.10"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.10/construct-darwin-arm64"
      sha256 "ba5489f713119179d970eae82c6026fea260af4ee7e7ccd23081430f3f063ccf"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.10/construct-darwin-x64"
      sha256 "a900314ce2efe7db6665d855fe85be254dbbe978516994854dcfcc68b6371cd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.10/construct-linux-arm64"
      sha256 "d8414d95b616083579501e15017d816ccd8911acae1ca3815f24ea1f47a6dc71"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.10/construct-linux-x64"
      sha256 "59e07a3f53ab8c31c1755774d8bb5d8ec4be941e7b24d8317f0a29f32644b566"
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
