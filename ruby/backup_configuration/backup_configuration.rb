#!/usr/bin/env ruby

DROPBOX_BACKUP_FOLDER = '/Volumes/LaCie/Jenkins\ Configuration'

raise '💣 Backup directory is missing.' unless directory_to_backup = ARGV.first
raise '💣 Dropbox directory is missing.' unless ARGV.count == 2 && dropbox_directory = ARGV.last
raise "💣 The backup and Dropbox directories shouldn't be identical." if ARGV.last == ARGV.first

puts '🍞 Duplicate the last backup repository.'
backup_folder_name = File.basename(directory_to_backup.gsub('FULL', 'CONFIGURATION'))
dropbox_folder = File.join dropbox_directory,
`cp -r #{directory_to_backup} #{dropbox_folder}`

puts '🍞 Remove all the build/ folders.'
`rm -rf #{dropbox_folder}/jobs/*/builds/`

puts '🎉 Backup to Dropbox completed.'
