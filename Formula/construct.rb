class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.17"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.17/construct-darwin-arm64"
      sha256 "43445d7e10d6b5195789aac8a0cd1147f2b923b2b11c8fcbfdb143300b986ed9"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.17/construct-darwin-x64"
      sha256 "58287c1012d9c1397cebb1b803b1274f450b4fc11acd884e79b156a5bdd06a35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.17/construct-linux-arm64"
      sha256 "a839e3be5489192e9c9f45c0cdd3ef9cdd735debbb6a84de8bc54b2b5286dfdb"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.17/construct-linux-x64"
      sha256 "cc7006dc392cbf83d7868eb80f78f0af30fea2f5de17218fc030f5c6fb299745"
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
