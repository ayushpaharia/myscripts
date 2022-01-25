set -Ux GOPATH $HOME/Desktop/go_workspace
set -Ux PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$GOPATH/bin:/usr/local/go/bin

alias edit_fish "code ~/.config/fish/config.fish"
alias source_fish "source ~/.config/fish/config.fish"
alias setup_warp "bash ~/Desktop/myscripts/utility/warp.sh"
alias air "~/Desktop/go_workspace/bin/air"

# ~/.config/fish/functions/nvm.fish
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# ~/.config/fish/functions/nvm_find_nvmrc.fish
function nvm_find_nvmrc
  bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
end

# ~/.config/fish/functions/load_nvm.fish
function load_nvm --on-variable="PWD"
  set -l default_node_version (nvm version default)
  set -l node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)
  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
    if test "$nvmrc_node_version" = "N/A"
      nvm install (cat $nvmrc_path)
    else if test nvmrc_node_version != node_version
      nvm use $nvmrc_node_version
    end
  else if test "$node_version" != "$default_node_version"
    nvm use default >> /dev/null
  end
end

# ~/.config/fish/config.fish
# You must call it on initialization or listening to directory switching won't work
load_nvm
