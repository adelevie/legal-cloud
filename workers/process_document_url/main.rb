require "aws/s3"
require "parse-ruby-client"
require "iron_worker_ng"
require "configuration"
require "pusher"


@config = Configuration.keys

@pusher_client = Pusher::Client.new({
  :app_id => @config["pusher"]["app_id"],
  :key    => @config["pusher"]["key"],
  :secret => @config["pusher"]["secret"]
})


#AWS::S3::Base.establish_connection!(
#  :access_key_id     => @config["aws_s3"]["access_key_id"],
#  :secret_access_key => @config["aws_s3"]["secret_access_key"]
#)

Parse.init :application_id => @config["parse"]["application_id"],
           :api_key        => @config["parse"]["api_key"]

Pusher.app_id = 'your-pusher-app-id'
Pusher.key = 'your-pusher-key'
Pusher.secret = 'your-pusher-secret'

@iron_worker_client = IronWorkerNG::Client.new(:token => @config["iron"]["token"], :project_id => @config["iron"]["project_id"])

result = params["number"].to_i * 2

p "result = #{result}"

@pusher_client.trigger(params["task_id"], "success", {"result" => result})