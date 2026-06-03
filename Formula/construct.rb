class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.18"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.18/construct-darwin-arm64"
      sha256 "cb5933274e56d2b3e957872ab75e8b24050cef577c70f414eb7831ee0b9cf8d2"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.18/construct-darwin-x64"
      sha256 "22541c0191d4640dd419ce5aed744dbba2a8c0a80fe4de9dcc19d850f823ad41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.18/construct-linux-arm64"
      sha256 "c10a950cfd56033e7790295f355fa9716b5316c1664ce3a5afe08f16279a9eb9"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.18/construct-linux-x64"
      sha256 "cc5b618ac5a6e5ca19a5b73cd22a1eba1146b9549ab69a0fae600195c1f136d2"
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
