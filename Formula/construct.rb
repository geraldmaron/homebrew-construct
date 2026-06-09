class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.24"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.24/construct-darwin-arm64"
      sha256 "bbbf6eda8be0f36e2da0de5b969b0c2b09e4c1ce8ac7cd3cd2a7de6adc0ead9f"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.24/construct-darwin-x64"
      sha256 "7dba881fca0287746ec49610d18faa7ac1f30067d41d60a7b5fb46684b8ba4b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.24/construct-linux-arm64"
      sha256 "d427ace7d9fcc8bb53be09da5034574cb3342f390f69f816315b19d47d88c3ad"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.24/construct-linux-x64"
      sha256 "8b2fb696f5847cd78ab3cc7769b309c7984be836f24e32154b069ce34c5a241a"
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
