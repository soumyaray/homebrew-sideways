class Sideways < Formula
  desc "Git worktree helper - easily manage parallel working directories"
  homepage "https://github.com/soumyaray/sideways"
  url "https://github.com/soumyaray/sideways/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "ae448c7720001f9da821f81af40834641fd65f83e16d6eccbb3001a4072e6ac1"
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
