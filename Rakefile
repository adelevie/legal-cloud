require "erb"

namespace :workers do

  task :upload, :name do |t, args|
    Dir.chdir 'workers'
    Dir.chdir args[:name].to_s

    p `iron_worker upload #{args[:name].to_s}`
  end

  task :queue, :name do |t, args|
    Dir.chdir 'workers'
    Dir.chdir args[:name].to_s

    p `iron_worker queue #{args[:name].to_s}`
  end

  #task :test, :name do |t, args|
  #  Dir.chdir 'workers'
  #  Dir.chdir args[:name].to_s
  #
  #  p `iron_worker run #{args[:name].to_s}` 
  #end
  
  task :generate, :name do |t, args|

    Dir.chdir 'workers'
    Dir.mkdir args[:name].to_s
    Dir.chdir args[:name].to_s

    # .worker
    File.open("../../templates/dot_worker.erb") do |io|
      template = ERB.new(io.read)

      File.open "#{args[:name]}.worker", "w" do |out| 
        out.puts template.result binding
      end
    end

    # main.rb
    File.open("../../templates/main.erb") do |io|
      template = ERB.new(io.read)

      File.open "main.rb", "w" do |out| 
        out.puts template.result binding
      end
    end

    # unit test for worker -- in-progress
    #File.open("../../templates/test.erb") do |io|
    #  template = ERB.new(io.read)

    #  File.open "test.rb", "w" do |out| 
    #    out.puts template.result binding
    #  end
    #end
  end
end