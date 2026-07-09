class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.5.2"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.2/construct-darwin-arm64"
      sha256 "a4601f1f57e20b424526dac04d2ddc43c5a0987f31f798fda065dc47a3816ec3"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.2/construct-darwin-x64"
      sha256 "965242e3ad0dee093c6f3a79c4ca130ca0256a35f23d36404c7465e644e3bc65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.2/construct-linux-arm64"
      sha256 "43ce02004ed4ec9d8443ce8551f2df94bb765931f8aab9109286972d6a52edca"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.2/construct-linux-x64"
      sha256 "27e3fb695d0849799aba5120725deadbccef769feef8969f33ef10dfd5645345"
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
