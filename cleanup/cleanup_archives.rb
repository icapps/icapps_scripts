#!/usr/bin/ruby

require 'plist'
require 'time'
require 'awesome_print'
require 'highline/import'

# Add the application's identifiers you don't want to be
# cleaned up.
identifiers_to_keep = %w(
  com.icapps.app-to-keep
)

# Define parameters.
path = File.expand_path '~/Library/Developer/Xcode/Archives/*'

# Create a list of all archives.
archives = Dir.glob(path).each_with_object([]) do |archive_folder, list|
  list << Dir.glob("#{archive_folder}/*")
end.flatten

# Group the list of archives/identifier.
grouped_archives = archives.group_by do |archive|
  identifier = ''
  # Read the identifier from the application plist.
  if plist_path = Dir.glob("#{archive}/*.plist").first
    identifier = Plist::parse_xml(plist_path).fetch('ApplicationProperties', {}).fetch('CFBundleIdentifier', '')
  end
  identifier
end

# Iterate the grouped archives and read
archives_to_delete = grouped_archives.each_with_object({}) do |(identifier, archives), list|
  unless identifiers_to_keep.include? identifier
    list[identifier] = archives
  end
end

# Print out the paths to delete.
if archives_to_delete.keys.empty?
  puts "No archives to clean..."
  exit 1
else
  ap archives_to_delete.keys
end

# Ask before deleting the archives.
confirm = ask("Are you sure you want to delete the archives belonging to the above archives? [y/n] ") { |yn| yn.limit = 1, yn.validate = /[yn]/i }
exit unless confirm.downcase == 'y'

# Delete all the archives.
archives_to_delete.each do |identifier, archives|
  ap "Deleting archives for #{identifier}"
  archives.each do |archive|
    command = "rm -rf '#{archive}'"
    `#{command}`
    puts "$ #{command}"
  end
end
