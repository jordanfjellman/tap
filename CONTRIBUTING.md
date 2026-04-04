# Adding New Formulas to This Tap

This tap supports multiple formulas. To add a new formula:

## Quick Steps

1. Create a new `.rb` file in the root of this repository
2. Follow the template below
3. Test locally: `brew install --build-from-source ./your-formula.rb`
4. Commit and push

## Formula Template

```ruby
class YourTool < Formula
  desc "Description of your tool"
  homepage "https://github.com/jordanfjellman/your-tool"
  version "1.0.0"
  license "MIT"

  on_arm do
    url "https://github.com/jordanfjellman/your-tool/releases/download/v1.0.0/your-tool-aarch64-apple-darwin.tar.gz"
    sha256 "sha256_hash_here"
  end

  def install
    bin.install "your-tool"
  end

  test do
    system "#{bin}/your-tool", "--version"
  end
end
```

## For Private Repository Releases

If your binary is in a private repo (like fjelly), use the GitHub API URL:

```ruby
class YourTool < Formula
  desc "Description of your tool"
  homepage "https://github.com/jordanfjellman/your-tool"
  version "1.0.0"
  license "MIT"

  on_arm do
    url "https://api.github.com/repos/jordanfjellman/your-tool/releases/assets/ASSET_ID",
        using: :github_private_release
    sha256 "sha256_hash_here"
  end

  def install
    bin.install "your-tool"
  end

  test do
    system "#{bin}/your-tool", "--version"
  end
end
```

Note: Users will need to set `HOMEBREW_GITHUB_API_TOKEN` to download from private repos.

## Calculating SHA256

```bash
shasum -a 256 your-binary.tar.gz
```

## Testing Your Formula

```bash
# Test syntax
brew style your-formula.rb

# Install locally
brew install --build-from-source ./your-formula.rb

# Test
brew test your-formula
```

## Directory Structure

```
tap/
├── README.md           # This file
├── CONTRIBUTING.md     # This guide
├── fjelly.rb          # Fjelly formula (auto-updated)
├── your-tool.rb       # Your new formula
└── .github/
    └── workflows/     # Automation (optional)
```

## Automation

If you want automatic updates like fjelly has:

1. Add a workflow to your source repo (like `.github/workflows/update-tap.yml` in fjelly)
2. Configure it to update this tap when you release new versions
3. Use a GitHub token with `repo` scope for cross-repo access
