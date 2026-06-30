class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.4.1"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.1/construct-darwin-arm64"
      sha256 "6248570ef17b7d154692c11e67c8895b66d594e4e41cd57e1ca8f62967ecd57e"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.1/construct-darwin-x64"
      sha256 "902f15a006c7e9c4f5f65cad72af6dddd17e58a762efda6c73aa9830f9f7dd7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.1/construct-linux-arm64"
      sha256 "2e2e3e1b2667f90e8fc522b61a74e212d421b6b2ba82fece54be8f48e7b22b37"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.4.1/construct-linux-x64"
      sha256 "ed46f5a4ea4091c11b2ed3760346707e718f389ec529c58c57da52e888e0968d"
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
