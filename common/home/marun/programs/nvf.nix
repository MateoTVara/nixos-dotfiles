{ ... }:

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
          tsx.enable = true;
          svelte.enable = true;
          astro.enable = true;

          rust.enable = true;
          typescript.enable = true;
          qml.enable = true;

          just.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        keymaps = [
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

        # leader + 'fe' to open netrw file explore
        luaConfigRC.neotreeToggleFocus = /* lua */ ''
          local function open_file_explorer()
              local file = vim.fn.expand("%:t")

              vim.cmd.Explore()

              vim.schedule(function()
                  vim.cmd("normal! gg")
                  vim.fn.search("^" .. vim.fn.escape(file, "\\") .. "$", "W")
              end)
          end
          vim.keymap.set("n", "<leader>fe", open_file_explorer, {
              desc = "Open netrw file explorer"
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
