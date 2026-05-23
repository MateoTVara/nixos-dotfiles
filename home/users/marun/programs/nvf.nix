{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "tokyonight";
          style = "night";
        };

        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        filetree.neo-tree = {
          enable = true;
        };

        statusline.lualine = {
          enable = true;
        };

        telescope = {
          enable = true;
        };

        autocomplete.blink-cmp = {
          enable = true;
        };

        autopairs.nvim-autopairs = {
          enable = true;
        };

        languages = {
          enableTreesitter = true;

          nix.enable = true;

          bash.enable = true;
          python.enable = true;
          lua.enable = true;

          html.enable = true;
          css.enable = true;
          typescript.enable = true;
          tsx.enable = true;
          svelte.enable = true;
          astro.enable = true;

          rust.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        keymaps = [
          {
            # leader + 'E' to toggle file tree
            key = "<leader>E";
            mode = "n";
            silent = true;
            action = ":Neotree toggle<CR>";
          }
          {
            # 'gl' for opening diagnostics in a floating window
            key = "gl";
            mode = "n";
            silent = true;
            action = "<cmd>lua vim.diagnostic.open_float()<CR>";
          }
          {
            # leader + 'rn' to rename symbol under cursor
            key = "<leader>rn";
            mode = "n";
            silent = true;
            action = "<cmd>lua vim.lsp.buf.rename()<CR>";
          }
        ];

        # leader + 'e' to toggle file tree focus
        luaConfigRC.neotreeToggleFocus = ''
          local function toggle_neotree_focus()
            local current_buf = vim.api.nvim_get_current_buf()
            local ft = vim.bo[current_buf].filetype

            if ft == "neo-tree" then
              vim.cmd("wincmd p")
            else
              vim.cmd("Neotree focus")
            end
          end

          vim.keymap.set("n", "<leader>e", toggle_neotree_focus, {
            desc = "Toggle Neo-tree focus",
            silent = true,
          })
        '';

        utility = {
          vim-wakatime = {
            enable = true;
          };
        };
      };
    };
  };
}
