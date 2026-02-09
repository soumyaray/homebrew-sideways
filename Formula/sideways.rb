class Sideways < Formula
  desc "Git worktree helper - easily manage parallel working directories"
  homepage "https://github.com/soumyaray/sideways"
  url "https://github.com/soumyaray/sideways/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "23423ba1baad484a7e324580946738414b0f6aaf9fd318608feebcbb3dde6c8b"
  license "MIT"
  head "https://github.com/soumyaray/sideways.git", branch: "main"

  def install
    libexec.install "worktrees.sh"

    # Create a wrapper that prints setup instructions
    (bin/"sideways-init").write <<~EOS
      #!/bin/bash
      echo 'Add this to your ~/.zshrc or ~/.bashrc:'
      echo ''
      echo '  # Sideways - git worktree helper'
      echo '  source "#{libexec}/worktrees.sh"'
    EOS
  end

  def caveats
    <<~EOS
      To activate sideways, add this to your shell config (~/.zshrc or ~/.bashrc):

        # Sideways - git worktree helper
        source "#{libexec}/worktrees.sh"

      Then restart your shell or run: source ~/.zshrc
    EOS
  end

  test do
    assert_predicate libexec/"worktrees.sh", :exist?
  end
end
