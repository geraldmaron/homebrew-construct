class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.0.11"
  license "Elastic-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.11/construct-darwin-arm64"
      sha256 "cbdac822fbf622362e12d17d731e963494983bba84d92b62c122bf987e508217"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.11/construct-darwin-x64"
      sha256 "4a25adf0c1b71a26c4f921e943728a362f1d11830c0113570d66d2f4b1ec0fbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.11/construct-linux-arm64"
      sha256 "6bb9824eeed53b6fd075681235c409b95d378bdd041eddd21acb82065d105a7a"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.0.11/construct-linux-x64"
      sha256 "58707efdccf334d710664a6da1fe7fe8f46017b0092bb85bfdd5f7a78559f81e"
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
