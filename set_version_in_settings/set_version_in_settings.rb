#!/usr/bin/ruby

require 'xcodeproj'

configuration = ENV['CONFIGURATION']
plist = ENV['PRODUCT_SETTINGS_PATH']
settings = "#{ENV['PROJECT_DIR']}/#{ENV['PROJECT_NAME']}/Settings.bundle/Root.plist"

if !File.exists?(plist)
	abort "NO PLIST FILE #{plist}"
end

if !File.exists?(settings)
	`touch #{settings}`
end

source_root = ENV['SRCROOT']
target_name = ENV['TARGET_NAME']

configuration_path = File.join source_root, "#{target_name}-Version.xcconfig"
file = File.new(configuration_path)
abort "NO FILE #{configuration_path}" if !File.exists?(configuration_path)
configuration_file = Xcodeproj::Config.new(file)

# Read the current configuration.
marketing_version_number = configuration_file.to_hash['BOLERO_MARKETING_VERSION']
build_version_number = configuration_file.to_hash['BOLERO_BUILD']
version = "#{marketing_version_number}.#{build_version_number}"

puts "Using bundle version ${version} from '${plist}'"
`/usr/libexec/PlistBuddy -c "set :PreferenceSpecifiers:1:DefaultValue #{version}" "#{settings}"`

