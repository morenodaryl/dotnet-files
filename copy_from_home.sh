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

if [ ! -d .local/share/nvim/lazy/nvim-treesitter/queries ]; then
  mkdir -p .local/share/nvim/lazy/nvim-treesitter/queries/vue
  mkdir -p .local/share/nvim/lazy/nvim-treesitter/queries/ruby
fi

# files
# cp "$HOME/.config/nvim/vimrc.vim" .config/nvim/vimrc.vim
cp -a "$HOME/.config/nvim/." .config/nvim/
# cp -a "$HOME/.config/nvim/lua/." .config/nvim/lua/
# cp "$HOME/.config/nvim/coc-settings.json" .config/nvim/coc-settings.json
cp "$HOME/.vimrc" .vimrc
cp "$HOME/.tmux.conf" .tmux.conf
cp "$HOME/.tmux.conf" .tmux.conf
cp ~/.local/share/nvim/lazy/nvim-treesitter/queries/vue/**.scm .local/share/nvim/lazy/nvim-treesitter/queries/vue/
cp ~/.local/share/nvim/lazy/nvim-treesitter/queries/ruby/**.scm .local/share/nvim/lazy/nvim-treesitter/queries/ruby/

echo "DONE ✅"
