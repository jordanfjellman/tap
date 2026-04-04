# This formula requires a GitHub token to download from the private repository.
# Setup options:
#   1. Export HOMEBREW_GITHUB_API_TOKEN with a personal access token (classic) with 'repo' scope
#   2. Run: gh auth login (if using GitHub CLI)
#
# Example: HOMEBREW_GITHUB_API_TOKEN=ghp_xxx brew install jordanfjellman/tap/fjelly

class Fjelly < Formula
  desc "AI-powered multi-repository task orchestration system"
  homepage "https://github.com/jordanfjellman/fjelly"
  version "0.2.0"
  license "MIT"

  on_arm do
    # Homebrew automatically uses HOMEBREW_GITHUB_API_TOKEN for GitHub URLs
    url "https://github.com/jordanfjellman/fjelly/releases/download/v0.2.0/fjelly-aarch64-apple-darwin.tar.gz"
    sha256 "a1908678adb76f21bbd9326904af220ce8d14861af4d0a3fd68dfd96db576697"
  end

  def install
    bin.install "fjelly"
  end

  test do
    system "#{bin}/fjelly", "--version"
  end
end
