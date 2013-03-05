require "bundler/setup"

require "iron_worker_ng"
require "parse-ruby-client"
require_relative "configuration"
require "pry"
require "pusher"
require "pusher-client"


@config = Configuration.keys

@pusher_client = Pusher::Client.new({
  :app_id => @config["pusher"]["app_id"],
  :key    => @config["pusher"]["key"],
  :secret => @config["pusher"]["secret"]
})

#PusherClient.logger = Logger.new(STDOUT)
options = {:secret => @config["pusher"]["secret"]}
@pusher_socket = PusherClient::Socket.new(@config["pusher"]["key"], options)

#AWS::S3::Base.establish_connection!(
#  :access_key_id     => @config["aws_s3"]["access_key_id"],
#  :secret_access_key => @config["aws_s3"]["secret_access_key"]
#)

Parse.init :application_id => @config["parse"]["application_id"],
           :api_key        => @config["parse"]["api_key"]

@iron_worker_client = IronWorkerNG::Client.new(:token => @config["iron"]["token"], :project_id => @config["iron"]["project_id"])

#total_documents = Parse::Query.new("Document").tap do |q|
#  q.count
#  q.limit = 0
#end.get["count"]

#runs = total_documents/1000 + 1

#documents = []
#runs.times do |i|
#  start = (i * 1000)
#  finish = (i * 1000) + 1000

#  documents << Parse::Query.new("Document").tap do |q|
#    q.limit = 1000
#    q.skip = start
#  end.get
#end

#documents.flatten!

#processed_documents = documents.map do |document|
#  {
#    "citations" => CitationExtractor.new(document).run!,
#    "names"     => NameExtractor.new(document).run!,
#    "definitions" => DefinitionsExtractor.new(document).run!
#  }
#end

#File.open('results.json', 'w') {|f| f.write(processed_documents)}

