require "bundler/setup"

require "iron_worker_ng"
require_relative "configuration"
require "pry"


@config = Configuration.keys

@iron_worker_client = IronWorkerNG::Client.new(:token => @config["iron"]["token"], :project_id => @config["iron"]["project_id"])

@client = @iron_worker_client

numbers = [1,2,3,4,5,6,7,9,10]

task_ids = numbers.map do |number|
  @client.tasks.create("add_two", "number" => number).id
end

task_ids.each do |tid|
  @client.tasks.wait_for(tid) do |task|
    p "task #{task.inspect} is finished"
  end
end

results = task_ids.map do |tid|
  @client.tasks.log(tid).delete('\n').to_i
end

binding.pry

# add_two worker code:
# p params['number'].to_i + 2
