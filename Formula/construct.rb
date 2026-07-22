class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "2.0.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.0/construct-darwin-arm64"
      sha256 "7db912a163b9f40392d6a2091002e4cbd36110633073ca2bae46c0ecfa6a6f88"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.0/construct-darwin-x64"
      sha256 "a51681e7b23240e10a5f208af8ebb8fa2739a02e8dbc22b8adf3e794afe4d21c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.0/construct-linux-arm64"
      sha256 "8e58fba4d2cf75ab76f47877a9f9dc469d965d1db67f62f3d3b8f7f317a79e24"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.0.0/construct-linux-x64"
      sha256 "c9fe6d593c35e1989c8c8ca7c043eae0d82450b8c5749b2aeeb44c8445dbbc72"
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
