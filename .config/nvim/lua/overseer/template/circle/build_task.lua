local overseer = require("overseer")
local Path = require("plenary.path")

local homedir = Path:new(Path.path.home)
local projectdir = homedir:joinpath("repositories"):joinpath("lucy-deployment")
local builddir = homedir:joinpath("repositories"):joinpath("build-release")

return {
	name = "Build Lucy",
	builder = function(_)
		return {
			cmd = { "ninja" },
			args = { "-j", "100" },
			name = "Build lucy",
			cwd = builddir:absolute(),
            components = {"default", "restart_on_save"},
			env = {},
			metadata = {},
		}
	end,
	desc = "Run ninja in the release build directory of Lucy",
	tags = { overseer.TAG.BUILD },
	priority = 0,
	condition = {
		dir = projectdir:absolute()
	},
}
