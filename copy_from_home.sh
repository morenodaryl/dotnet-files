echo 'Copying from home'


config_dir=".config"

rm -rf ./.config/**
rm -rf ./.tmux/**

if [ ! -d "$config_dir/coc" ]; then
  # -p to create subdirectories
  mkdir -p .config/coc
fi

if [ ! -d "$config_dir/nvim" ]; then
  mkdir -p .config/nvim/lua
fi

if [ ! -d .tmux ]; then
  mkdir -p .tmux
fi

# files
cp "$HOME/.config/nvim/init.lua" .config/nvim/init.lua
cp "$HOME/.config/nvim/vimrc.vim" .config/nvim/vimrc.vim
cp "$HOME/.config/nvim/lua/plugins.lua" .config/nvim/lua/plugins.lua
cp "$HOME/.config/nvim/coc-settings.json" .config/nvim/coc-settings.json
cp "$HOME/.vimrc" .vimrc
cp "$HOME/.tmux.conf" .tmux.conf

echo "DONE ✅"
