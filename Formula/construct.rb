class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.3.2"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.2/construct-darwin-arm64"
      sha256 "a4c77018c6383b51a5ee9190305406e3a0014e4e264c8157391753c612ff5ac8"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.2/construct-darwin-x64"
      sha256 "617714b5bff332724a6262a263d8a185e6c3a875c855fa457b696ddb84f71560"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.2/construct-linux-arm64"
      sha256 "5b9b09ac22bdc71a060da383a3a6b57763bc857db67f5ccfb6026a04e6977c86"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.2/construct-linux-x64"
      sha256 "aa63b383327280e811b5e9412879554de1fccbc20dab84a81ddbeed906b705e7"
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
