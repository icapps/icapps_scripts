require 'nokogiri'
require 'plist'

dict = Hash.new

latestKey = ""

@doc = File.open(ARGV[0]) { |f| 
	Nokogiri::XML(f).xpath("//dict/*[self::key or self::string]").each do | key | 
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
}

puts dict

result = Plist::parse_xml(ARGV[1])

dict.each do |key, value|
  result[key] = value
end

File.open(ARGV[1], 'w') { |file| file.write(result.to_plist) }