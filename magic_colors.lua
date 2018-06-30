
-- Convert an integer into a hexadecimal. With respect to this script,
-- that integer should be between 0 and 100.
function hex_color(num)
	local hexnums = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
	local str = ""
	
	while num > 0 do
		local mod = math.fmod(num, 16)
		str = hexnums[mod+1] .. str
		num = math.floor(num / 16)
	end
	
	if string.len(str) == 0 then str = "00"
	elseif string.len(str) == 1 then str = "0" .. str end
	
	return str
end
	
	
-- Generate a hexadecimal color code based on a percent read in from
-- a conky config file.
function conky_gen_color(var)
--	print(var)
	
	local p = conky_parse(var)
		
	local r = math.floor(math.min(255,255*(p*2/100)))
	local g = math.floor(math.min(255,255*((100-p)*2/100)))
	local b = 0;
	
--	print(r .. " " .. g .. " " .. b)
	
	local str = "${color " .. hex_color(r) .. hex_color(g) .. "00}"
	
	return str
end
