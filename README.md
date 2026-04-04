# jordanfjellman/tap

A Homebrew tap for jordanfjellman's command-line tools.

## Available Formulas

### fjelly

AI-powered multi-repository task orchestration system.

```bash
# Install
HOMEBREW_GITHUB_API_TOKEN=your_token brew install jordanfjellman/tap/fjelly

# Or if you have gh CLI authenticated:
brew install jordanfjellman/tap/fjelly
```

## Setup

### For Private Repository Access

Since the binaries are hosted in a private repository, you need to authenticate:

#### Option 1: Environment Variable (Recommended)
```bash
export HOMEBREW_GITHUB_API_TOKEN=ghp_your_personal_access_token
brew install jordanfjellman/tap/fjelly
```

#### Option 2: GitHub CLI
```bash
gh auth login
brew install jordanfjellman/tap/fjelly
```

#### Option 3: Git Credential Helper
```bash
git config --global credential.helper osxkeychain
# First time brew will prompt for credentials
```

### Creating a Personal Access Token

1. Go to GitHub Settings → Developer Settings → Personal Access Tokens → Tokens (classic)
2. Generate new token with `repo` scope
3. Copy the token and use it as `HOMEBREW_GITHUB_API_TOKEN`

## Adding More Formulas

To add a new formula to this tap:

1. Create a new `.rb` file in the root of this repository
2. Follow the Homebrew formula structure
3. Test with `brew install --build-from-source ./your-formula.rb`
4. Commit and push

Example formula structure:
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

## Repository Structure

```
.
├── README.md              # This file
├── fjelly.rb              # Fjelly formula
├── your-future-tool.rb    # Future formulas
└── .github/
    └── workflows/         # Automation workflows (optional)
```

## Development

### Testing Changes

```bash
# Tap this repository
brew tap jordanfjellman/tap https://github.com/jordanfjellman/tap

# Install from local formula
brew install --build-from-source ./fjelly.rb

# Or test without tapping
brew install --build-from-source ./fjelly.rb
```

### Updating a Formula

1. Edit the `.rb` file
2. Update the `url` and `sha256` (use `shasum -a 256 file.tar.gz`)
3. Update the `version` if needed
4. Commit and push

## License

Formulas in this tap follow their respective project licenses.
