require 'nokogiri'
require 'plist'

# Dictonary to hold the new generate plist file
dict = Hash.new
# Variable to hold the last extracted key
latestKey = ""

# Read the generated plist file
Nokogiri::XML(File.open(ARGV[0])).xpath("//dict/*[self::key or self::string]").each do | key |
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

# Merge the two files together
result = Plist::parse_xml(ARGV[1])
dict.each do |key, value|
  result[key] = value
end

# Write the new plist file
File.open(ARGV[1], 'w') { |file|
	file.write(CGI::unescapeHTML(result.to_plist.gsub /&amp;/, "&"))
}
