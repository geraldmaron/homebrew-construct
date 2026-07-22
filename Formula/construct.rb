class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "2.0.1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.1/construct-darwin-arm64"
      sha256 "8e85d69378208b3aebec6084b892b827f576f5dd22e619c641908b21c12aa17f"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.1/construct-darwin-x64"
      sha256 "71e4984f7d78f98b1a9e2edbc5456ff61cc6920721a30f2443b3de81dcdafd1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.1/construct-linux-arm64"
      sha256 "6708aa8da52b6bbafb6cc8d7a25071a9c185d7d1dec67a3874a2b7ce499453a8"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.1/construct-linux-x64"
      sha256 "1a804b4318566f8578091513e872ffde0ec40d69e80b65ea6134fae9cc6380d5"
    end
  end

  def install
    bin.install Dir["construct-*"].first => "construct"
  end

  def caveats
    <<~EOS
      Run 'construct install --footprint=user' then 'construct init' in your project.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/construct version")
  end
end
