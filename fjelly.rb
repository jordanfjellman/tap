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
    url "https://api.github.com/repos/jordanfjellman/fjelly/releases/assets/390550886",
        using: :github_private_release
    sha256 "935c4f036f1adc57d8a66aa28a693c015f39eb4f836e0ed420f3c93689b53c31"
  end

  def install
    bin.install "fjelly"
  end

  test do
    system "#{bin}/fjelly", "--version"
  end
end
