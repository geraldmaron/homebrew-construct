class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.4.0"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.0/construct-darwin-arm64"
      sha256 "851509d81752000a549fdfdb2be66f78ad1df913239104e7dd4d22aa1253a7f4"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.0/construct-darwin-x64"
      sha256 "e0a1747cda249b7f68322ec691444430298be2da1fa1f407b6d815d3396b2b41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.0/construct-linux-arm64"
      sha256 "2efd8d0c2c4033ffed5092dc7c6fd2e4ed2a0d26fba2ba72c7a7c63e0ff00b01"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.0/construct-linux-x64"
      sha256 "f6b54c214fced5980951ff3e5d930809a31b9ee0c8f01faf0bb599ce0de25acf"
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
