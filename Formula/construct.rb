class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.1.1"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.1.1/construct-darwin-arm64"
      sha256 "46c3429fbc1eba1a81eab1b1e8535c8ac7ded7d52dd81caa3498eed6595a4e3a"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.1.1/construct-darwin-x64"
      sha256 "0da79d9cae849594dd0c29db8cc54a88d4c124a29298b66ae6d7e2c7219a1d4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.1.1/construct-linux-arm64"
      sha256 "76db95e7f5ee0f8767a2029ae1ce20c3d088d338cd526a4d52aed077281b18c8"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.1.1/construct-linux-x64"
      sha256 "73d3f4efe82bf14593d8479e8a6514f32e9e549d25726c277a7cde968ce0542a"
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
