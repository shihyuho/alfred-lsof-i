cmd = "{query}"
xml = "<?xml version=\"1.0\"?>\n<items>\n"

processes = `lsof -i#{cmd} -sTCP:LISTEN | awk '{ print $1,$2,$8,$9; }'`.split("\n").drop(1)

if processes.size == 0
	processes = `lsof -i:#{cmd} -sTCP:LISTEN | awk '{ print $1,$2,$8,$9; }'`.split("\n").drop(1)
end

if processes.size == 0
	processes = `lsof -i -sTCP:LISTEN | grep -i [^/]*#{Regexp.quote(cmd)}[^/]*$ | awk '{ print $1,$2,$8,$9; }'`.split("\n")
end

if processes.size == 0
	item="\t<item uid=\"\" arg=\"\">"
	item+="<title>No process found listening #{cmd}</title>"
	item+="<subtitle>Enter another [46][protocol][@hostname|hostaddr][:service|port]</subtitle>"
	item+="<icon>icon.png</icon>"
	item+="</item>\n"
	xml += item
else 
	processes.uniq.each do | process |
		# puts "process: " + process

		psName, psId, psNode, psAddr = process.match(/(.*)\s+(\d+)\s+(.*)\s+(.*)/).captures

		# puts "psId: " + psId
		# puts "psName: " + psName
		# puts "psNode: " + psNode

		ps = `ps -A -o pid -o comm | grep #{psId}`
		# puts "ps: "+ps

		psPath = ps.match(/(\d+)\s+(.*)/).captures[1]
		# puts "psPath: "+psPath

		type = "fileicon"
		icon = psPath.match(/.*?\.app\//)
		if !icon
			icon = "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/ExecutableBinaryIcon.icns"
			type = ""
		end
		# puts "icon: " + icon

		item="\t<item uid=\"#{psName}\" arg=\"#{psId}\">"
		item+="<title>#{psName}</title>"
		item+="<subtitle>[#{psNode}] #{psAddr} @ #{psPath}</subtitle>"
		item+="<icon type=\"#{type}\">#{icon}</icon>"
		item+="</item>\n"
		xml += item
	end
end

xml += "</items>"

puts xml