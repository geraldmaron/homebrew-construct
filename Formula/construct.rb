class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "2.1.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.1.0/construct-darwin-arm64"
      sha256 "7c45ff83bfe15520eecb7108217ebfef98f7d4096e7ab3de56cdfdd5252965af"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.1.0/construct-darwin-x64"
      sha256 "6ff4baad140f0fb0660a93d8694c2304e3f02d8e6c49bb3aab5c67d3f9f26998"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v2.1.0/construct-linux-arm64"
      sha256 "cb476c92885c83fc51fb5f63ade876a477472b00a3848452776355f640d0d611"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v2.1.0/construct-linux-x64"
      sha256 "26f57321a7b06230b22d8e8e1bf7d9feefa5527493fb66bedae0613f5b8fc360"
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
