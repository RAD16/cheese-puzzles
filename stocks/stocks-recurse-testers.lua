--[[
	Solve for greatest difference of two-values in 
	an array, left-to-right only, e.i. buying a stock
	for the greatest profit.
]]
		
iter2 = function(tab, j, n, highnum)
	if tab[j] == nil then 
		return highnum 
	else
		print(" We are  " .. n .. "rounds into this.") 
		diff = tab[j] - tab[n]
		if diff > highnum then
			highnum = diff
		end
		iter2(tab, j + 1, n, highnum)
	end 
	return highnum
end 

local function day(tab)
	n = 1 
	profit = 0 
	local highnum = 0

							print("Day Loop")		-- test
	while n < #tab do
		j = n + 1

							print("  ITER2 item [" .. tab[n] .. "]") 	-- test
		local high = iter2(tab, j, n, highnum)
							print("> Day fn: 'high' is " .. high) -- test

		if high > profit then
			profit = high
		end
		n = n + 1
	end
	return profit
end

local tab1 = { 7, 1, 5, 3, 6, 4 } -- 5
local tab2 = { 7, 6, 4, 3, 1 } -- 0 
local tab3 = { 3, 1, 10, 6, 4 } -- 9
local tab4 = { 1, 3 } -- 0 
local tab5 = { 37, 29, 11, 60, 51, 59, 103, 39, 41, 6, 24, 87 } -- 92
local poop1 = { 6 } -- 0
local poop2 = { } -- 0

-- print("Best Profit for Table 1: " .. day(tab1))
-- print("Best Profit for Table 2: " .. day(tab2))
print("Best Profit for Table 3: " .. day(tab3))
print("Best Profit for Table 4: " .. day(tab4))
print("Best Profit for Table 5: " .. day(tab5))
-- print("Best Profit for Poop 1: " .. day(poop1))
-- print("Best Profit for Poop 2: " .. day(poop2))




