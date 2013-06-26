require 'rufus/scheduler'
scheduler = Rufus::Scheduler.start_new

scheduler.every '4m' do
  require "net/http"
  require "uri"
  url = 'http://intellicrash.herokuapp.com'
  Net::HTTP.get_response(URI.parse(url))
end
