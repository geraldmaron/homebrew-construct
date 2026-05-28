class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.12"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.12/construct-darwin-arm64"
      sha256 "422ed74285e43dee1d3e5e6233653feb1b4aee77ad780e1cec4b372bd170fc0b"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.12/construct-darwin-x64"
      sha256 "091055249ac6d9651fe02d3a6683f4144bf717bfae9657f1021a0d6e39cae88e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.12/construct-linux-arm64"
      sha256 "9f3a0801653ae033b678d5ab348768b547fdc14ef500ee2e64dea664aa7abdba"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.12/construct-linux-x64"
      sha256 "4bc4bc091951a0fffdc6a11e3b99a71aa854e514b86460c9f6a774d53e85d41f"
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
