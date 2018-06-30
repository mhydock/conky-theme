local mc = assert(loadfile('/home/mhydock/.config/openbox/magic_colors.lua'))
mc()


require 'lfs'
--require 'magic_colors.lua'

if conky_gen_color ~= nil
then print "file loaded" 
else print "file not found"
end

function conky_build_mount_list()
	local fstitle = "${color grey}/ $color$alignr${fs_used /}/${fs_size /}\n"
	local color = conky_gen_color("${fs_used_perc /}")	
	local output = fstitle .. color .. "${fs_bar 6 /}\n\n"

	fstitle = "${color grey}/home $color$alignr${fs_used /home}/${fs_size /home}\n"
	color = conky_gen_color("${fs_used_perc /home}")
	output = output .. fstitle .. color .. "${fs_bar 6 /home}"

	-- print(output)

	for file in lfs.dir[[/media/mhydock]] do
		if file ~= nil and file ~= "." and file ~= ".." then
		    -- print ("found file " .. file .. " with mode " .. lfs.attributes("/media/mhydock/"..file,"mode"))
			if lfs.attributes("/media/mhydock/"..file,"mode") == "directory" then
				output = output .. "\n\n${color grey}" .. file .. " $color$alignr${fs_used /media/mhydock/" .. file .. "}/${fs_size /media/mhydock/" .. file .. "}\n"
				output = output .. conky_gen_color("${fs_used_perc /media/mhydock/" .. file .. "}") .. "${fs_bar 6 /media/mhydock/" .. file .. "}"
			end
		end
	end

	return output
end

