"" ┌─────────────────────────────────────────────────────────────────┐  
"" |                       __                                        |
"" |                ____  / /_  ______ _(_)___  _____                |
"" |               / __ \/ / / / / __ `/ / __ \/ ___/                |
"" |              / /_/ / / /_/ / /_/ / / / / (__  )                 |
"" |             / .___/_/\__,_/\__, /_/_/ /_/____/                  |
"" |            /_/            /____/                                |
"" |                                                                 |
"" └─────────────────────────────────────────────────────────────────┘ 

let need_to_install_plugins = 0
let xdg_data_home = $XDG_DATA_HOME
if empty(xdg_data_home) 
  let xdg_data_home = $HOME . "/.local/share";
endif
let vimplug = xdg_data_home . "/nvim/site/autoload/plug.vim"
if empty(glob(vimplug))
    silent execute "!curl -fLo " . vimplug . " --create-dirs "
        \ . "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync
    let need_to_install_plugins = 1
endif

call plug#begin()
  Plug 'preservim/nerdcommenter'
  
  " File browser with git indicators
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " git indicator in editor
  Plug 'airblade/vim-gitgutter'

  " neovim language things
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  " Nicer LSP UI
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'folke/lsp-colors.nvim'
  Plug 'onsails/lspkind-nvim'

	Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
	Plug 'groenewege/vim-less', { 'for': 'less' }

	" Theme
	Plug 'overcache/NeoSolarized'
	
call plug#end()

