local M = {}

function M.find_plugin_path(plugin)
    for _, path in ipairs(vim.api.nvim_list_runtime_paths()) do
        if path:match(string.gsub(plugin, "%.", "%%.")) then
            return path
        end
    end
    return nil
end

function M.apply_patch(patch_file_path, plugin)
    local plugin_dir = M.find_plugin_path(plugin)
    
    if not plugin_dir then
        print("Error: snacks.nvim not found in runtimepath")
        return false
    end
    
    patch_file_path = vim.fn.stdpath("config") .. "/" .. patch_file_path
    local f = io.open(patch_file_path, "r")
    if not f then
        print("Error: Patch file not found: " .. patch_file_path)
        return false
    end
    f:close()
    
    local git_check = io.popen(string.format("cd %s && git rev-parse --git-dir 2>/dev/null", plugin_dir))
    local is_git = git_check:read("*a")
    git_check:close()
    
    local cmd
    if is_git and is_git ~= "" then
        cmd = string.format("git apply %s -p1 --directory=%s --unsafe-paths", patch_file_path, plugin_dir)
    else
        print("Warning: not a git directory: " .. plugin_dir)
    end
    
    local handle = io.popen(cmd .. " 2>&1")
    local result = handle:read("*a")
    local success = handle:close()
    
    if not success then
        print("Error applying patch:")
        print(result)
        return false
    end

    return true
end

return M
