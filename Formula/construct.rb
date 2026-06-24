class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.2.3"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.3/construct-darwin-arm64"
      sha256 "bf793a83337cc7f7d218d377d55540156cb87ec8dfe4f9b396bf0690a5f2d8ef"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.3/construct-darwin-x64"
      sha256 "0cad601cbdd868c68ad384bf380184e381614c9f8fa0150f3ed17fb00ef711bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.3/construct-linux-arm64"
      sha256 "4cba599e64c2a8a6d5447575fe854e625feb6a38f4cbb264151847f2425ab1cc"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.2.3/construct-linux-x64"
      sha256 "0303fb138eb92f2125287b907e0eae56ae80fdb6ba01d871b16ea729a29a695a"
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
