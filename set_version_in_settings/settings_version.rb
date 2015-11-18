#!/usr/bin/ruby

require 'xcodeproj'

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

version = `/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${INFOPLIST_FILE}"`
build = `/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${INFOPLIST_FILE}"`

puts "Using bundle version #{version} and build #{build}"
`/usr/libexec/PlistBuddy -c "set :PreferenceSpecifiers:1:DefaultValue #{version}" "#{settings}"`