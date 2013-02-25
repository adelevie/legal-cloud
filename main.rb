require "bundler/setup"

require "iron_worker_ng"
require "parse-ruby-client"
require_relative "configuration"
require "pry"

@config = Configuration.keys

AWS::S3::Base.establish_connection!(
  :access_key_id     => @config["aws_s3"]["access_key_id"],
  :secret_access_key => @config["aws_s3"]["secret_access_key"]
)

Parse.init :application_id => @config["parse"]["application_id"],
           :api_key        => @config["parse"]["api_key"]

@iron_worker_client = IronWorkerNG::Client.new(:token => @config["iron"]["token"], :project_id => @config["iron"]["project_id"])

task = Parse::Object.new("Task")
task.save
task.started_at = Parse::Date.new(DateTime.now)

document_urls = []
document_urls.each do |document_url|
  params = {
    "document_url" => document_url, 
    "task_id" => task['objectId'],
    "config" => @config
  }
  client.tasks.create("process_document_url", params)
end