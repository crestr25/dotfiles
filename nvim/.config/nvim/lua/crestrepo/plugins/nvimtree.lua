return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")
		local icons = require("crestrepo.utils.icons")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- configure nvim-tree
		nvimtree.setup({
			sync_root_with_cwd = true,
			view = {
				width = 35,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				symlink_destination = true,
				icons = {
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					glyphs = {
						default = icons.ui.Text,
						symlink = icons.ui.FileSymlink,
						bookmark = icons.ui.BookMark,
						folder = {
							arrow_closed = icons.ui.ChevronRight,
							arrow_open = icons.ui.ChevronShortDown,
							default = icons.ui.Folder,
							open = icons.ui.FolderOpen,
							empty = icons.ui.EmptyFolder,
							empty_open = icons.ui.EmptyFolderOpen,
							symlink = icons.ui.FolderSymlink,
							symlink_open = icons.ui.FolderOpen,
						},
						git = {
							unstaged = icons.git.FileUnstaged,
							staged = icons.git.FileStaged,
							unmerged = icons.git.FileUnmerged,
							renamed = icons.git.FileRenamed,
							untracked = icons.git.FileUntracked,
							deleted = icons.git.FileDeleted,
							ignored = icons.git.FileIgnored,
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = icons.diagnostics.BoldHint,
					info = icons.diagnostics.BoldInformation,
					warning = icons.diagnostics.BoldWarning,
					error = icons.diagnostics.BoldError,
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- set which-key keymaps
    local wk = require("which-key")

    wk.register({
      e = {
        name = "Nvim-Tree",
        e = { "<cmd>NvimTreeToggle<CR>", "Toggle file Explorer"},
        c = { "<cmd>NvimTreeCollapse<CR>", "Collapse file Explorer"},
        r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file Explorer"},
      }
    }, { prefix = "<leader>"} )

	end,
}
