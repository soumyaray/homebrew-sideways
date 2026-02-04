# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Homebrew tap repository (`homebrew-sideways`) for distributing the `sideways` git worktree helper tool. Users install via:

```bash
brew tap soumyaray/sideways
brew install sideways
```

## Repository Structure

- `Formula/sideways.rb` - Homebrew formula that installs from tagged releases of the main `soumyaray/sideways` repo

## Common Tasks

### Testing the Formula Locally

```bash
brew install --build-from-source Formula/sideways.rb
```

### Auditing the Formula

```bash
brew audit --strict Formula/sideways.rb
```

### Releasing a New Version

1. In the main `sideways` repo, create and push a tag: `git tag vX.Y.Z && git push origin vX.Y.Z`
2. Get the SHA256: `curl -sL https://github.com/soumyaray/sideways/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256`
3. Update `Formula/sideways.rb` with the new version in the URL and the new SHA256

## Formula Notes

- The formula installs `worktrees.sh` to `libexec` and creates a `sideways-init` helper script
- Users must source the script in their shell config to activate the tool
- The `caveats` block displays post-install instructions automatically
