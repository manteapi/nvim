local nullls = require("null-ls")
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")
local DIAGNOSTICS = methods.internal.DIAGNOSTICS

local devmojilint= {
	name = "devmojilint",
	meta = {
		url = "https://github.com/folke/devmoji",
		description = "Linter for Git commit messages.",
	},
	method = DIAGNOSTICS,
	filetypes = { "gitcommit", "NeogitCommitMessage" },
	generator = nullls.generator({
		command = "devmoji",
		args = { "--lint", "--text", "$TEXT" },
		to_temp_file = true,
		from_stderr = true,
		format = "raw",
		check_exit_code = function(code)
			return code <= 1
		end,
        on_output = function(params, done)
            local diags = {}
            if (params.output == nil or params.output == '') then
                done(diags)
            end
            local splits = vim.split(params.output, "\n")
            local output = ""
            for index, data in ipairs(splits) do
                data = data:gsub("%✖ ", "")
                data = data:gsub("%  ", "")
                if index ~= #splits-1 then
                    output = output .. " " .. data
                end
            end
            table.insert(diags, {
                row = 1,
                col = 1,
                end_col = 1,
                message = output,
                severity = "error",
            })
            done(diags)
        end,
	}),
	factory = h.generator_factory,
}

return devmojilint
