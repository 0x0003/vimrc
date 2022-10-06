#!/usr/bin/env bash
# vim8+ "package manager" with AIDS

# start - load on startup
# opt - load on demand with :packadd
# NOTE: opt packages won't generate :help entries
function group {
  gname=$1
  load=$2
  gpath="$HOME/.vim/pack/$gname/$load"
  mkdir -p "$gpath"
  cd "$gpath" || exit 1
}

function pak {
  repo=$1
  fsname=$(basename "$repo" .git)
  if [ -d "$fsname" ]; then
    cd "$fsname" || exit 1
    result=$(git pull --force)
    echo "$fsname: $result"
  else
    echo "Installing $fsname"
    git clone -q "$repo" --depth 1
  fi
}

(
group lint start
pak https://github.com/w0rp/ale.git &
wait
) &

(
group autocomplete start
pak https://github.com/maralla/completor.vim.git &
pak https://github.com/tmsvg/pear-tree.git &
wait
) &

(
group quality start
pak https://github.com/machakann/vim-sandwich.git &
pak https://github.com/tpope/vim-commentary.git &
pak https://github.com/nathanaelkane/vim-indent-guides.git &
pak https://github.com/mbbill/undotree.git &
pak https://github.com/tpope/vim-fugitive &
wait
) &

(
group quality opt
pak https://github.com/vim-scripts/colorizer.git &
pak https://github.com/junegunn/vim-easy-align.git &
wait
) &

(
group snippets start
pak https://github.com/SirVer/UltiSnips.git &
pak https://github.com/honza/vim-snippets.git &
wait
) &

(
group lang start
pak https://github.com/neovimhaskell/haskell-vim.git &
wait
) &

wait

old_plugins=$(find ./*/*/*/.git -prune -mmin +5 -print | sed "s/\/.git//")
if [ -n "$old_plugins" ]; then
  echo "Removing old plugins"
  echo $old_plugins | xargs rm -rf
fi

# Generate :help entries
#vim +":helptags ALL" +":noautocmd qa!"

