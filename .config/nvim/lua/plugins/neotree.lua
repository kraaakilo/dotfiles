return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      false
    }
  },
  config = function ()
    require("catppuccin").setup({
      integrations = {
        neotree = true,
      }
    })
  end
}
