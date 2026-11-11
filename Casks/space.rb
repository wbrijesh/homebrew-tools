# Space: https://github.com/wbrijesh/space. Install: brew install --cask wbrijesh/tools/space
# Updated by `just publish` in that repo (from packaging/homebrew/space.rb), which sets the
# version and the zip's sha256.
cask "space" do
  version "0.1.3"
  sha256 "333aac7e1ee7fab66e1aa7ce52167787eb950e7de4ce1749ce7711881ee4e5ed"

  url "https://github.com/wbrijesh/space/releases/download/v#{version}/Space-#{version}-arm64.zip"
  name "Space"
  desc "Native macOS development environment built around projects, bots and knowledge"
  homepage "https://github.com/wbrijesh/space"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Space.app"

  # Signed ad hoc, not notarized (no Developer ID yet): clear the download mark so macOS opens it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Space.app"]
  end

  # `brew uninstall --zap space` also removes your threads, settings and traces.
  zap trash: "~/.space"

  caveats <<~EOS
    Space uses your Claude subscription through the Claude CLI. Install it and sign in once:
      brew install --cask claude-code
      claude
  EOS
end
