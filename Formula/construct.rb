class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.20"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.20/construct-darwin-arm64"
      sha256 "49ed08577706f01f32c74c9dded115496072d84b8939b75d0e6948b3656aca0d"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.20/construct-darwin-x64"
      sha256 "4bfe9c5b912e1563a2d0afc88005d883c9f0128ef8d8c642c7537b8522ef83ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.20/construct-linux-arm64"
      sha256 "f0ed1faa213af5c07cae8bb93932f12771ace96d87964bba2d068708e1a6fbe6"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.20/construct-linux-x64"
      sha256 "5292404a35d71d01488138526efddcb16addaddb2454e8f37df7fe68738f0148"
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
