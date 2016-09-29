function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_status_symbol
  set -l git_status (git status --porcelain ^/dev/null)
  if test -n "$git_status"
    # Is there anyway to preserve newlines so we can reuse $git_status?
    if git status --porcelain ^/dev/null | grep '^.[^ ]' >/dev/null
      echo '*' # dirty
    else
      echo '#' # all staged
    end
  else
    echo    '' # clean
  end
end

function _remote_hostname
  if test -n "$SSH_CONNECTION"
    echo (whoami)@(hostname)
  end
end

function _prompt_terminator
  if [ (uname) = "Darwin" ]
    echo '⟩ '
  else
    echo '> '
  end
end

function fish_prompt
  set -l yellow (set_color --bold yellow)
  set -l normal (set_color normal)

  set -l cwd (prompt_pwd)
  set -l git_status (_git_branch_name)(_git_status_symbol)

  if test -n "$git_status"
    set git_status " $git_status"
  end

  echo -n (_remote_hostname) $normal$cwd$yellow$git_status$normal (_prompt_terminator)
end
