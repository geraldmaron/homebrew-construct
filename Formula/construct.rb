class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.5.4"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.4/construct-darwin-arm64"
      sha256 "b942afcd5099f6941044a613e4c4df0de96e6d4eae88b8faf2f0d65b325816d1"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.4/construct-darwin-x64"
      sha256 "8a9172ee521ae471441776244fbdac0bf5ea6b7e6b544ecb5ba2769c4b47c761"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.4/construct-linux-arm64"
      sha256 "701a1605f6fb47dc483863019100954139d66ba787bc22ea46ef35de285ed11e"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.4/construct-linux-x64"
      sha256 "1a54e04924059b3bb5a9ca65e5f6f9683ab6f6813e97969b6cce32fc83f632c3"
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
