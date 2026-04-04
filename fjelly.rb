# This is a placeholder formula that will be automatically updated by the release workflow.
# See the fjelly repository: https://github.com/jordanfjellman/fjelly

# To install:
#   HOMEBREW_GITHUB_API_TOKEN=your_token brew install jordanfjellman/tap/fjelly

class Fjelly < Formula
  desc "AI-powered multi-repository task orchestration system"
  homepage "https://github.com/jordanfjellman/fjelly"
  version "0.2.0"
  license "MIT"

  # This formula will be updated automatically when new releases are published
  # The actual binary URL and SHA256 will be populated by the GitHub Actions workflow

  on_arm do
    url "https://api.github.com/repos/jordanfjellman/fjelly/releases/assets/PLACEHOLDER"
    sha256 "PLACEHOLDER"
  end

  def install
    bin.install "fjelly"
  end

  test do
    system "#{bin}/fjelly", "--version"
  end
end
