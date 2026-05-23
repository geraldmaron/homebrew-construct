class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.5"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.5/construct-darwin-arm64"
      sha256 "cb26f40216876e1dd1371f741cbd1ae4253f6c79335db35855781cc6041e74f0"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.5/construct-darwin-x64"
      sha256 "01ac2042ac3195c3e5d68eab4270db2728995b8947c662f2f1305e48d0efbc0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.5/construct-linux-arm64"
      sha256 "0f52ac93546813a09f0bc86703d780b30b9d077943fb3162ddb3af59bd34e5b4"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.5/construct-linux-x64"
      sha256 "da3e768d40cdf2e4d4ceff7017f7c3a49df2473786af0274839534bf914ad872"
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
