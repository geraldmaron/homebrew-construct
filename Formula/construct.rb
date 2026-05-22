# Construct — Homebrew formula template.
#
# Authoritative copy lives in the construct repo at templates/homebrew/
# construct.rb. The tap repo (geraldmaron/homebrew-construct) carries the
# active formula at Formula/construct.rb and is updated by the release
# workflow's Homebrew bump step on every tag push.
#
# When the release pipeline fires for `vX.Y.Z`, dawidd6/action-homebrew-bump-
# formula rewrites the url + sha256 fields for each platform from the
# matching GitHub Release asset. The placeholder SHAs below are only used
# when seeding the tap by hand the first time.
class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.3"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.3/construct-darwin-arm64"
      sha256 "9076d92543ca1926cc82d0d70b3c5074102e1498250f6dfcbf38be10a34cd259"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.3/construct-darwin-x64"
      sha256 "87c6153dee6cbef8b7be22d54da189c5fe4ffa3a4703af129e60a60f570c2718"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.3/construct-linux-arm64"
      sha256 "aa7fa19ddf0990180dadaae55c23d2a64a2be8517161233f7ab0c65c03b80f96"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.3/construct-linux-x64"
      sha256 "62c0070786c69b32f823eab06764b45758ad8f8c30696886b181357b378d861f"
    end
  end

  def install
    bin.install Dir["construct-*"].first => "construct"
  end

  def caveats
    <<~EOS
      To finish setup on this machine, run:
        construct init

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
