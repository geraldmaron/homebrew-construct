class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "2.1.1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.1.1/construct-darwin-arm64"
      sha256 "1508307607b6852e579cff514e3cb6e2af05c0b28b94f2db8b65b8771b3df26b"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.1.1/construct-darwin-x64"
      sha256 "1396b1ed38cb3421c65da6be9a9110f1f72548d7d52f3c09309bc491aef3c04e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.1.1/construct-linux-arm64"
      sha256 "1676ffaa8ba660ef02f0da8bccc4a470defa4d2f1bb66290275dd7d3186fcd1d"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.1.1/construct-linux-x64"
      sha256 "357f9bf42f1dc1a79083aecdbf8d8aaa9c98469a354de838641d6ee4caf2e059"
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
