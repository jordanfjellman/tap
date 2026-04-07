# This formula requires a GitHub token to download from the private repository.
# Setup options:
#   1. Export HOMEBREW_GITHUB_API_TOKEN with a personal access token
#   2. Run: gh auth login (if using GitHub CLI)
#   3. Set GITHUB_TOKEN environment variable
#
# Example: HOMEBREW_GITHUB_API_TOKEN=your_token brew install jordanfjellman/tap/fjelly

class Fjelly < Formula
  desc "AI-powered multi-repository task orchestration system"
  homepage "https://github.com/jordanfjellman/fjelly"
  version "0.3.1"
  license "MIT"

  on_arm do
    url "https://api.github.com/repos/jordanfjellman/fjelly/releases/assets/390553397",
        using: :github_private_release
    sha256 "7791152615529909b2d2bf786c32def8a56c09c4193a5f7d70684a198c449c33"
  end

  def install
    bin.install "fjelly"
  end

  test do
    system "#{bin}/fjelly", "--version"
  end
end
