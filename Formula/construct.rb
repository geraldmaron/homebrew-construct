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
  version "1.0.4"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.4/construct-darwin-arm64"
      sha256 "75a52c4c6b22ac3e566ce4fff40a6dab08dee3d239f773c00b133c1775a22bd5"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.4/construct-darwin-x64"
      sha256 "9703ca6b9218411a85f05dd6d0a574d0b4e90c0dc768dd02824c228a829388ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.4/construct-linux-arm64"
      sha256 "fb8f95932b084912f095645a01f9011a015081dff097b5d57cc863b79fb4b2c0"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.4/construct-linux-x64"
      sha256 "1e5fffe21a68c5b5b6755c37c10ff6aa82f057f6cd0edc1a533efdc426ccac5e"
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
