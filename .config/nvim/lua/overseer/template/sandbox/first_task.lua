local overseer = require("overseer")

return {
  -- Required fields
  name = "Build Lucy",
  builder = function(params)
    -- This must return an overseer.TaskDefinition
    return {
      -- cmd is the only required field
      cmd = {'ninja'},
      -- additional arguments for the cmd
      args = {"-j", "100"},
      -- the name of the task (defaults to the cmd of the task)
      name = "Build lucy",
      -- set the working directory for the task
      cwd = "/home/pierre-luc/repositories/build-release",
      -- additional environment variables
      env = {},
      -- the list of components or component aliases to add to the task
      -- components = {"my_custom_component", "default"},
      -- arbitrary table of data for your own personal use
      metadata = {
        -- foo = "bar",
      },
    }
  end,
  -- Optional fields
  desc = "Run ninja in the release build directory of Lucy",
  -- Tags can be used in overseer.run_template()
  tags = {overseer.TAG.BUILD},
  params = {
    -- See :help overseer.params
  },
  -- Determines sort order when choosing tasks. Lower comes first.
  priority = 0,
  -- Add requirements for this template. If they are not met, the template will not be visible.
  -- All fields are optional.
  condition = {
    -- filetype = {"qml, cpp, hpp, h, c"},
    dir = "/home/pierre-luc/repositories/lucy-deployment",
    -- Arbitrary logic for determining if task is available
    callback = function(search)
      print(vim.inspect(search))
      return true
    end,
  },
}
