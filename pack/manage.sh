#!/bin/bash
# vim8 package manager with AIDS

# pak_type:
#   start - load on startup
#   opt - load on demand with :packadd
# NOTE: opt packages won't generate help docs
function group () {
  group_name=$1
  pak_type=$2
  group_path="$HOME/.vim/pack/$group_name/$pak_type"
  mkdir -p "$group_path"
  cd "$group_path" || exit
}

function pak () {
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull --force)
    echo "$expected_repo: $result"
  else
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url" --depth 1
  fi
}

(
group lint start
pak https://github.com/w0rp/ale.git &
wait
) &

(
group autocomp start
pak https://github.com/maralla/completor.vim.git &
# parens/quotes/etc
pak https://github.com/Raimondi/delimitMate.git &
wait
) &

(
group quality start
# delete, change and add surroundings in pairs
pak https://github.com/machakann/vim-sandwich.git &
# comments
pak https://github.com/tpope/vim-commentary.git &
# display lines at each indent level
pak https://github.com/nathanaelkane/vim-indent-guides.git &
# undo tree
pak https://github.com/mbbill/undotree.git &
wait
) &

(
group quality opt
# highlight rgb and hex colors
pak https://github.com/vim-scripts/colorizer.git &
# auto alignment
pak https://github.com/junegunn/vim-easy-align.git &
wait
) &

(
group snippets start
pak https://github.com/SirVer/UltiSnips.git &
pak https://github.com/honza/vim-snippets.git &
wait
) &

wait

old_plugins=$(find ./*/*/*/.git -prune -mmin +5 -print | sed "s/\/.git//")
if [ -n "$old_plugins" ]; then
  echo "Removing old plugins..."
  echo $old_plugins | xargs rm -rf
fi

# Generate help docs
#vim +":helptags ALL" +":noautocmd qa!"

