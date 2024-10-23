require("emfy0")

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/emfy0/plugins', [[v:val =~ '\.lua$']])) do
  require('emfy0.plugins.'..file:gsub('%.lua$', ''))
end
