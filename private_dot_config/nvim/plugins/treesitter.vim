"" treesitter
UsePlugin 'nvim-treesitter'

lua <<EOF
local ok, configs = pcall(require, 'nvim-treesitter.configs')
if ok then
  configs.setup {
    ensure_installed = {
      "typescript",
      "tsx",
    },
    highlight = {
      enable = true,
    },
  }
end
EOF
