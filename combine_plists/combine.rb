require 'nokogiri'
require 'plist'
require 'colorize'

# Array to hold the files
files = ARGV
# Dictonary to hold the new generate plist file
dict = Hash.new
# Variable to hold the last extracted key
latestKey = ""

# Read the generated plist files
(0..(files.count-2)).each do |i|
	Nokogiri::XML(File.open(files[i])).xpath("//dict/*[self::key or self::string]").each do | key |
		key_string = key.to_s
		if key_string.include? "<key>"
			key_string.slice! "<key>"
			key_string.slice! "</key>"
			latestKey = key_string
		elsif key_string.include? "<string>"
			key_string.slice! "<string>"
			key_string.slice! "</string>"
			dict[latestKey] = key_string
		end
	end
end

# Merge the two files together
result = Plist::parse_xml(files.last)
dict.each do |key, value|
  result[key] = value
end

# Write the new plist file
File.open(files.last, 'w') { |file|
	file.write(result.to_plist.gsub /&amp;/, "&")
}

# Print Success
puts "[INFO] Combine: Success".colorize(:green)