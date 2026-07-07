class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.5.1"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.1/construct-darwin-arm64"
      sha256 "047a7123bc56268c77170479a7abe39157528ab1105ae4fbb0239de7752c13ca"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.1/construct-darwin-x64"
      sha256 "cd3ba9afe5ec9e3a0fa35afe861e25101638dcdcd00e09a7d840dbd23e5a4a9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.1/construct-linux-arm64"
      sha256 "9a6d5f1ab98919e066f8c541570bb0c95e761f535d37ccd9ffc73462085ab62f"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.1/construct-linux-x64"
      sha256 "9f669a3c64286f26c89a52571b60e7b41ddecdb43e4681d5ad3881b39d1287d3"
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
