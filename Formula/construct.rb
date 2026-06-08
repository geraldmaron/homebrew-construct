class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.23"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.23/construct-darwin-arm64"
      sha256 "6b589c2e8a534b5a6b0337d5b1a6db1866447e0e70fcc77fb20dad8367ac8a54"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.23/construct-darwin-x64"
      sha256 "dcafe7c1cf274143d722ff477c262d5f72cb65dcdf96a6f39012e40f0230e43b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.23/construct-linux-arm64"
      sha256 "927857f6bbf0305f6bd6a9750aea5e3d7ca1947bfb7d37076e24c8f6b3f9bc35"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.23/construct-linux-x64"
      sha256 "fea803cdbab09ba8c14ed654f1ea96e5f22744efff2e3dc3b693aef4ed4af3ab"
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
