return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker"
    },
    lazy = false,  -- загружаем сразу
    config = function()
      local copy_path = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local results = {
          filepath,
          modify(filepath, ":."),
          modify(filepath, ":~"),
          filename,
          modify(filename, ":r"),
          modify(filename, ":e"),
        }

        vim.ui.select({
          "1. Absolute path: " .. results[1],
          "2. Path relative to CWD: " .. results[2],
          "3. Path relative to HOME: " .. results[3],
          "4. Filename: " .. results[4],
          "5. Filename without extension: " .. results[5],
          "6. Extension of the filename: " .. results[6],
        }, { prompt = "Choose to copy to clipboard:" }, function(choice)
          if choice then
            local i = tonumber(choice:sub(1,1))
            if i then
              local result = results[i]
              vim.fn.setreg('"', result)
              vim.notify("Copied: " .. result)
            end
          end
        end)
      end

      require("neo-tree").setup({
        commands = {
          copy_path = copy_path,  -- регистрируем команду
        },
        window = {
          mappings = {
            ["Y"] = "copy_path",  -- маппим клавишу на команду
          },
        },
      })

      -- Пример: toggle NeoTree с <leader>e
      vim.keymap.set("n", "<leader>e", "<Cmd>Neotree float toggle<CR>")
    end,
  }
}
