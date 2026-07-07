class Construct < Formula
  desc "Local-first agent orchestration layer for AI coding tools"
  homepage "https://github.com/geraldmaron/construct"
  version "1.5.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.0/construct-darwin-arm64"
      sha256 "595e5ee74cb3bea298f1db9548282dca8417fe986bc439641a946595a6c54ea4"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.0/construct-darwin-x64"
      sha256 "652b72b0f348e3a6297e109964b37cadce149a9d82b1fa9f7fdc1d387ac4d5c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.0/construct-linux-arm64"
      sha256 "4e042ad3e39e0c2f3528b9ab9f8a459ff3698429bbae7ce53f9eedd6fb12e2f2"
    end
    on_intel do
      url "https://github.com/geraldmaron/construct/releases/download/v1.5.0/construct-linux-x64"
      sha256 "4ae903de02b8e57b40d7cc237643d2a459ac5aff712ef4c2ae2d8a1f6e92daac"
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
