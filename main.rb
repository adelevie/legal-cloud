require "iron_worker_ng"
require "parse-ruby-client"
require_relative "config"
require "pry"


keys = Configuration.keys

binding.pry

#task = Parse::Object.new("Task")
#task.save
#task.started_at = DateTime.now

#client = IronWorker::Client.new
#document_urls = []
#document_urls.each do |document_url|
#  params = {
#    "document_url" => document_url, 
#    "task_id" => task['objectId'],
#  }
#  client.tasks.create("process_document_url", params)
#end