class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "2.0.2"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.2/construct-darwin-arm64"
      sha256 "dcc4380455e29491c1f6f4bf1d02f13bb1d16e48ed8dba388d077b2d74d7b26c"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.2/construct-darwin-x64"
      sha256 "cd8b2601e40b4c067f8f41de8a939f81f9d76dce1121e6c9e52a9d007483e42e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.2/construct-linux-arm64"
      sha256 "2a26a1f0054b421f6f11907caee20f1533a82ac91f46fe96b7518c1429853f3c"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.2/construct-linux-x64"
      sha256 "8040cb1660e3549a87e92536f0ea8a53388d8220e060bb993915b75018074c79"
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
