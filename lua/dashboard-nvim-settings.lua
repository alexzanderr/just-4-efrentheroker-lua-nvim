

-- require("dashboard_nvim").setup{}

vim.g.dashboard_custom_shortcut={
	last_session =        'SPC s l',
	find_history =        'SPC f h',
	find_file =           'SPC f f',
	new_file =            'SPC c n',
	change_colorscheme =  'SPC t c',
	find_word =           'SPC f a',
	book_marks =          'SPC f b',
}

-- https://github.com/glepnir/dashboard-nvim/wiki/Ascii-Header-Text
-- ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
-- ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
-- ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
-- ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
-- ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝


vim.g.dashboard_custom_footer = "hello wolrd"

-- let g:dashboard_custom_shortcut_icon['last_session'] = ' '
-- let g:dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
-- let g:dashboard_custom_shortcut_icon['find_file'] = ' '
-- let g:dashboard_custom_shortcut_icon['new_file'] = ' '
-- let g:dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
-- let g:dashboard_custom_shortcut_icon['find_word'] = ' '
-- let g:dashboard_custom_shortcut_icon['book_marks'] = ' '
