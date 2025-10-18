return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local path_sep = package.config:sub(1, 1)
    local config_dir = vim.fn.stdpath("config")
    local vendor_black = table.concat({ config_dir, "vendor", "black_pure" }, path_sep)
    local python_bin = table.concat({ vim.fn.stdpath("data"), "mason", "packages", "black", "venv", "bin", "python" }, path_sep)
    local pythonpath = vendor_black
    if vim.env.PYTHONPATH and vim.env.PYTHONPATH ~= "" then
      pythonpath = pythonpath .. package.pathsep .. vim.env.PYTHONPATH
    end

    conform.setup({
      formatters_by_ft = {
        python = { "black" },
        -- add other filetypes here
      },
      formatters = {
        black = {
          command = python_bin,
          args = { "-m", "black", "--fast", "--stdin-filename", "$FILENAME", "-" },
          stdin = true,
          env = {
            PYTHONPATH = pythonpath,
          },
        },
      },
      -- preserve your other options like format_on_save, default_format_opts, etc.
    })
  end,
}
