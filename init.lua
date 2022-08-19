local providers = {
      "python3_provider",
      "node_provider",
    }

    for _, plugin in pairs(providers) do
      vim.g["loaded_" .. plugin] = nil
      vim.cmd("runtime " .. plugin)
    end
