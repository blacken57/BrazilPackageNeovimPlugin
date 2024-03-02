-- Plugin Implementation starting point

-- Utils
local function get_line_number()
	local r, c = unpack(vim.api.nvim_win_get_cursor(0))
	return r
end

local function get_package_name()
	local package_dir = vim.fs.find({ "Config", "README.md" }, { upward = true })[1]
	local words = {}
	for word in string.gmatch(package_dir, "[^" .. "/" .. "]+") do
		table.insert(words, word)
	end
	return words[#words - 1]
end

-- Get the code.amazon.com link for the particular file
local function get_repo_link()
	local line_number = get_line_number()
	local package_name = get_package_name()
	local combination = package_name .. " : " .. line_number
	vim.notify(combination)
end

vim.keymap.set("n", "<Leader>h;", get_repo_link)

-- Example generated value: https://code.amazon.com/packages/CartExperienceHorizonteWebapp/blobs/1ad2865d65fa5b0356848790054b604e0446f33d/--/src/com/amazon/cart/experience/tags/urls/CategoryLandingPageUrlTag.java?__session=eyJwa2ciOiJDYXJ0RXhwZXJpZW5jZUhvcml6b250ZVdlYmFwcCIsInRhYnMiOlt7ImZpbGUiOiJDYXJ0RXhwZXJpZW5jZUhvcml6b250ZVdlYmFwcC90cmVlcy9tYWlubGluZSJ9LHsiZmlsZSI6InNyYy9jb20vYW1hem9uL2NhcnQvZXhwZXJpZW5jZS90YWdzL3VybHMvQ2F0ZWdvcnlMYW5kaW5nUGFnZVVybFRhZy5qYXZhI0wxNCJ9XX0%3D#L14

-- local M = {}
-- function M.setup()
-- 	vim.notify("Setup function is being run")
-- 	vim.keymap.set("n", "<Leader>h", get_repo_link)
-- end
--
-- return M
