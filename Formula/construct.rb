class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.5.6"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.6/construct-darwin-arm64"
      sha256 "14628efa6402bfbe3ff643ac3c8c561e5a8373e7c81a62619a95ed7a6b9fcd02"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.6/construct-darwin-x64"
      sha256 "bc6103f7188124f0f3afd2e74d094a3c4d371dc92d5cab61e85029bd67d872cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.6/construct-linux-arm64"
      sha256 "eddd385d9147e73bc990d7ab99c61cd30169896c4d44417e5970d246b0129a12"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.6/construct-linux-x64"
      sha256 "671773d0ba73c623070d3a58efd2cf565eafd5fc1a798613d19d261ccb43c8e1"
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
