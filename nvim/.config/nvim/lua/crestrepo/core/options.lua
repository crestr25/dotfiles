-- sets main options from options (table)
local vim_opts = function(options)
	if options ~= nil then
		for scope, table in pairs(options) do
			for setting, value in pairs(table) do
				vim[scope][setting] = value
			end
		end
	end
end

vim.opt.shortmess:append("sIW")

vim_opts({
	opt = {
		autowrite = true,
		autochdir = true,
		breakindent = true,
		breakindentopt = "shift:2,min:40,sbr",
		clipboard = "unnamedplus",
		colorcolumn = "100",
		cursorline = true,
		cursorlineopt = "number",
		confirm = true,
		expandtab = true,
		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",
		foldlevel = 99,
		foldlevelstart = 99,
		foldopen = "jump,block,hor,mark,percent,quickfix,search,tag,undo",
		foldenable = true,
		guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
		hidden = true,
		ignorecase = true,
		linebreak = true,
		laststatus = 3,
		number = true,
		numberwidth = 6,
		showmode = false,
		signcolumn = "yes",
		softtabstop = 4,
		shiftwidth = 4,
		showbreak = "=>>",
		scrolloff = 5,
		smartcase = true,
		sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
		tabstop = 4,
		textwidth = 100,
		termguicolors = true,
		updatetime = 100,
		undofile = true,
	},
})
