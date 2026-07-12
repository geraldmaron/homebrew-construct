class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.5.5"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.5/construct-darwin-arm64"
      sha256 "52d9fa49fcd547e623c118ec13a15810af7bfccc3259fd574a1909055269caf6"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.5/construct-darwin-x64"
      sha256 "d4e866ca23c16a370eedc5f3981ce7caf09827c2a87c1afb358ba8ef1de3500f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.5/construct-linux-arm64"
      sha256 "6091bd87f7fe15fd525d28ccf2582dce76d6407929559f6755316e91bacc45ea"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.5/construct-linux-x64"
      sha256 "ac42af2fe85ed87c29cdd6c10d0ff240ec77c41602aa06ad21cec318cd189b3b"
    end
  end

  def install
    bin.install Dir["construct-*"].first => "construct"
  end

  def caveats
    <<~EOS
      Run 'construct install --scope=user' then 'construct init' in your project.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/construct version")
  end
end
