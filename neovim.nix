{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # UI
      snacks-nvim
      noice-nvim
      nui-nvim
      lualine-nvim
      bufferline-nvim
      which-key-nvim
      nvim-web-devicons

      # completion
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp

      # snippets
      luasnip
      cmp_luasnip

      # other
      nvim-lspconfig
      nvim-cmp
      flash-nvim

      # treesitter
      nvim-treesitter
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.c
      nvim-treesitter-parsers.cpp
      nvim-treesitter-parsers.cmake
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.vim
      nvim-treesitter-parsers.vimdoc
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.toml
      nvim-treesitter-parsers.markdown
      nvim-treesitter-parsers.markdown_inline

      # mini
      mini-icons
      mini-pairs
      mini-surround
      mini-hipatterns
      mini-move
      mini-ai

      # themes
      eldritch-nvim
      gruvbox-nvim
      kanagawa-nvim
      kanagawa-paper-nvim
      nightfox-nvim
      onedarkpro-nvim
      oxocarbon-nvim
    ];

    extraPackages = with pkgs; [
      nixd
      nixfmt

      basedpyright
      ruff

      lua-language-server

      clang-tools
    ];

    initLua = ''
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins")
require("lsp")

require("theme")
    '';
  };
}
