require 'rubygems'
require 'curb'
require 'yajl'

# This uses the 'curb' libcurl wrapper for ruby, found at https://github.com/taf2/curb/  
# This uses the 'yajl' YAJL wrapper for ruby, found at https://github.com/brianmario/yajl-ruby
# prints each json message to stdout.

user = "YOUR_USERNAME_HERE"
pass = "YOUR_PASSWORD_HERE"
url = "YOUR_STREAM_URL_HERE"

parser = Yajl::Parser.new

parser.on_parse_complete = Proc.new do |msg| 
  puts msg
end

Curl::Easy.http_get url do |c|
  c.http_auth_types = :basic
  c.username = user
  c.password = pass
  c.verbose = true
  c.on_body do |data|
    puts data
    data.size # required by curl's api.
  end
end
