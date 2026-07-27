if status is-interactive
	fastfetch    # Commands to run in interactive sessions can go here
end
alias ls="lsd"
alias homelab="ssh homelab"

# pnpm
set -gx PNPM_HOME "/home/ro/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

# Go command-line tools (for example: countdown)
if test -d "$HOME/go/bin"
  if not contains "$HOME/go/bin" $PATH
    set -gx PATH "$HOME/go/bin" $PATH
  end
end

# Start an SSH agent for GitHub. Add the key once per login with:
# ssh-add ~/.ssh/id_ed25519_github
set -l ssh_agent_socket "$HOME/.ssh/agent/ssh-agent.sock"
if not set -q SSH_AUTH_SOCK; or not test -S "$SSH_AUTH_SOCK"
  if not test -S "$ssh_agent_socket"
    mkdir -p "$HOME/.ssh/agent"
    ssh-agent -a "$ssh_agent_socket" >/dev/null
  end
  set -gx SSH_AUTH_SOCK "$ssh_agent_socket"
end
