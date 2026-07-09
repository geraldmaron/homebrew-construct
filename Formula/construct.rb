class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.5.3"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.3/construct-darwin-arm64"
      sha256 "4768a1a8668dc9a67f9c974b9fa049acf4c67671085bf31d0c750a4e8093c050"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.3/construct-darwin-x64"
      sha256 "ba608d7e745cf65bf0c8b1345283b15b2324af07a55439033aa63227400af097"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.3/construct-linux-arm64"
      sha256 "88c62da289c7034fd2c7e4ca1d58ddcdb4c8209e443e4ffbc0cb2952da87650f"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.3/construct-linux-x64"
      sha256 "0bbdd7beb85178e11426b719641b2cd440bf0f0491cef8f4f8338f78f4fd2b73"
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
