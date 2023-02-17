local opt = {
	settings = {
		gopls = {
			-- PAINPOINT
			usePlaceholders = true,
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
}

return opt
