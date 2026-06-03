class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.19"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.19/construct-darwin-arm64"
      sha256 "da9e68ed359913dc1f2e0bbf15dd34326b1491d2481ecd09023c6bb5671438ce"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.19/construct-darwin-x64"
      sha256 "15af35874667dd4e6281dbc443325632a12c8137c46c3b04f222c1a6f1440652"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.19/construct-linux-arm64"
      sha256 "184abe53f40e3cbe0aee00fdf7e7a727f22b6d5511dda35fb4b48d2028f67bf0"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.19/construct-linux-x64"
      sha256 "5a85fa26be4fd5ab3a465a4c0aa94eaa1389cc3558afd98d8acea8fe19793e2d"
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
