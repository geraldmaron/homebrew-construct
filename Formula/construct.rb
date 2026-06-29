class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.3.0"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.0/construct-darwin-arm64"
      sha256 "04a4fb638f86ce9160906c3717741314ea8d6a1dbc0f98edc06f50442d7621b3"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.0/construct-darwin-x64"
      sha256 "97b2a031381a9f82c320ffd122b981039cb65bf14e337bdef83d776f4ed8cedc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.0/construct-linux-arm64"
      sha256 "fedee729190c04e2dc3cf805e32d612fd595c74c82f2d65c9f61f88da6e7cb29"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.3.0/construct-linux-x64"
      sha256 "fe1e2444cb482c2314c1a8c74feac4b1597e64ebf298b3660cf29ced22742ab2"
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
