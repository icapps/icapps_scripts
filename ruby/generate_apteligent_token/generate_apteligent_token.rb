#!/usr/bin/ruby

require 'uri'
require 'json'
require 'colorize'
require 'highline/import'

puts 'Generate your Apteligent OAuth token for dSYM uploading.'.white

### Stop the application from running. The given message
### is displayed in the CLI.
def stop(message)
  puts message.red
  exit
end

### Ask the user for input. Set the secure parameter to tru
### if you don't want to see the input.
def ask_input(question, secure=false)
  ask(question) { |q| q.echo = !secure }
end

### Generate the curl command to fetch the token.
def curl_command(username, password, client_id, app_id, secure=true)
  url = 'https://developers.crittercism.com/v1.0/token'

  curl_command = "curl -X POST #{url}"
  curl_command << " -u #{client_id}"
  curl_command << " -d 'grant_type=password&"
  curl_command << "username=#{URI.escape(username)}&"
  curl_command << "password=#{secure ? '********' : URI.escape(password)}&"
  curl_command << "scope=app%2F#{app_id}%2Fsymbols&"
  curl_command << "duration=31536000'"
  curl_command
end

### Execute and print the generated curl command to fetch the
### token from Apteligent.
def perform_curl(username, password, client_id, app_id)
  puts curl_command(username, password, client_id, app_id).white
  `#{curl_command(username, password, client_id, app_id, false)}`
end

### Ask the user to enter it's username.
username = ask_input '1. Enter your Apteligen username: '.green
stop("Username '#{username}' is invalid.") if username.empty?

### Ask the user to enter it's oauth client id.
client_id = ask_input '2. Enter your Apteligen OAuth client id: '.green
stop("OAuth client id '#{client_id}' is invalid.") if client_id.empty?

### Ask the user to enter it's password id.
password = ask_input '3. Enter your Apteligen password [hidden]: '.green, true
stop("Password '#{password}' is invalid.") if password.empty?

### Ask the user to enter it applicable application id.
app_id = ask_input '4. Enter the Apteligen Application id: '.green
stop("Application id '#{app_id}' is invalid.") if app_id.empty?

### Perform the curl command
result = perform_curl username, password, client_id, app_id
parsed_result = JSON.parse result
if error_description = parsed_result['error_description']
  puts error_description.red
else
  puts "Generated OAuth application token: #{parsed_result['access_token']}".green
  puts "This token will be valid until #{Time.now + parsed_result['expires_in']}".green
end
