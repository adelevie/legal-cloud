namespace :workers do
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

    # iron.json
    File.open("../../templates/iron.json.erb") do |io|
      template = ERB.new(io.read)

      File.open "iron.json", "w" do |out| 
        out.puts template.result binding
      end
    end
  end
end