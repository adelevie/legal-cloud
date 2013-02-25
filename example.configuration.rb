# usage:
# require_relative "path/to/configuration.rb"
# keys = Configuration.keys
# keys["parse"]["application_id"]

module Configuration
  def self.keys
    {
      "iron" => {
        "project_id" => "123",
        "token"      => "456"
      },
      "parse" => {
        "application_id" => "789",
        "api_key"        => "abc"
      },
      "aws_s3" => {
        "access_key_id"     =>  "def",
        "secret_access_key" => "ghi"
      }
    }
  end
end