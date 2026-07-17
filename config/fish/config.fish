if status is-interactive
	fastfetch    # Commands to run in interactive sessions can go here
end
alias ls="lsd"


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
