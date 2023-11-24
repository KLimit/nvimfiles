local function cattable(t, ...)
	-- pinsp(...)
	for _, tab in ipairs{...} do
		for _, value in ipairs(tab) do
			table.insert(t, value)
		end
	end
	return t
end

return cattable
