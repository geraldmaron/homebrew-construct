class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.3.1"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.1/construct-darwin-arm64"
      sha256 "5702f58ec64d9dc980ce114dbec5ee398a3dffa7a101345de562ed6563104450"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.1/construct-darwin-x64"
      sha256 "06342d8a98633ee4a0d7c654638ef0769ffa302059d88e2263a095bb67473757"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.1/construct-linux-arm64"
      sha256 "cdb6a60a1a23e3cbb3e8732d05b962cae96ef2a95bbce193657d4ca843c4b132"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.1/construct-linux-x64"
      sha256 "aca6333e49779a37c6f86f3c7f21100dd54b806dd231c619731b0d7b5c8eb38d"
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
