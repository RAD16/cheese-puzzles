--[[
	Solve for greatest difference of two-values in 
	an array, left-to-right only, e.i. buying a stock
	for the greatest profit.
]]

function profit_wl(tab)
	local n = 1 
	profit = 0 

	while n < #tab do
		local j = n + 1
		local highnum = 0
		while j <= #tab do 
			diff = tab[j] - tab[n]
			if diff > highnum then
				highnum = diff
			end
			j = j + 1
		end
		if highnum > profit then
			profit = highnum
		end
		n = n + 1
	end
	return profit
end


function profit_no_loop(tab)
	local low, diff, res, i = tab[1], 0, 0, 2

	while i <= #tab do
		if tab[i] > low then
			diff = tab[i] - low 
			if res < diff then res = diff end
		else low = tab[i]
		end
		i = i + 1
	end
	return res
end


function profit_no_loop_recur(tab)

	iter = function (tab, size, low, diff, res)
		if size == 0 then return 0 end

		if tab[i] > low then
			diff = tab[i] - low 
			if res < diff then res = diff end
		else low = tab[i]
		end
		print(size, low, diff, res)
		return profit_no_loop_recur(tab, #tab - 1, low, diff, res), res
	end
end


local tab1 = { 7, 1, 5, 3, 6, 4 }
local tab2 = { 7, 6, 4, 3, 1 }
local tab3 = { 3, 1, 10, 6, 4 }
local tab4 = { 1, 3 }
local tab5 = { 37, 29, 11, 60, 51, 59, 103, 39, 41, 6, 24, 87 }
local tabx = { 5, 4, 6, 4, 2, 3, 5 }
local poop1 = { 6 }
local poop2 = { }

print("Profit No Loop Recur: " .. profit_no_loop_recur(tabx))

--[[
print("Profit for Table 1 --  " ..  profit_no_loop(tab1))
print("Profit for Table 2 --  " ..  profit_no_loop(tab2))
print("Profit for Table 3 --  " ..  profit_no_loop(tab3))
print("Profit for Table 4 --  " ..  profit_no_loop(tab4))
print("Profit for Table 5 --  " ..  profit_no_loop(tab5))
print("Profit for Table x --  " ..  profit_no_loop(tabx))
print("Profit for Poop 1  --  " ..  profit_no_loop(poop1))
print("Profit for Poop 2  --  " ..  profit_no_loop(poop2))
]]

-- print("Profit for Table 1 -- Loop:  " .. profit_wl(tab1) .. " || No Loop: " ..  profit_no_loop(tab1))
-- print("Profit for Table 2 -- Loop:  " .. profit_wl(tab2) .. " || No Loop: " ..  profit_no_loop(tab2))
-- print("Profit for Table 3 -- Loop:  " .. profit_wl(tab3) .. " || No Loop: " ..  profit_no_loop(tab3))
-- print("Profit for Table 4 -- Loop:  " .. profit_wl(tab4) .. " || No Loop: " ..  profit_no_loop(tab4))
-- print("Profit for Table 5 -- Loop:  " .. profit_wl(tab5) .. " || No Loop: " ..  profit_no_loop(tab5))
-- print("Profit for Table x -- Loop:  " .. profit_wl(tabx) .. " || No Loop: " ..  profit_no_loop(tabx))
-- print("Profit for Poop 1  -- Loop:  " .. profit_wl(poop1) .. " || No Loop: " ..  profit_no_loop(poop1))
-- print("Profit for Poop 2  -- Loop:  " .. profit_wl(poop2) .. " || No Loop: " ..  profit_no_loop(poop2))




