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
  version "0.2.0"
  license "MIT"

  on_arm do
    url "https://api.github.com/repos/jordanfjellman/fjelly/releases/assets/388882110",
        using: :github_private_release
    sha256 "a1908678adb76f21bbd9326904af220ce8d14861af4d0a3fd68dfd96db576697"
  end

  def install
    bin.install "fjelly"
  end

  test do
    system "#{bin}/fjelly", "--version"
  end
end
