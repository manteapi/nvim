local overseer = require("overseer")

return {
	name = "Build Lucy",
	builder = function(_)
		return {
			cmd = { "ninja" },
			args = { "-j", "100" },
			name = "Build lucy",
			cwd = "/home/pierre-luc/repositories/build-release",
            components = {"default", "restart_on_save"},
			env = {},
			metadata = {},
		}
	end,
	desc = "Run ninja in the release build directory of Lucy",
	tags = { overseer.TAG.BUILD },
	priority = 0,
	condition = {
		dir = "/home/pierre-luc/repositories/lucy-deployment",
	},
}
