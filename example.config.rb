module Configuration

  def self.keys
    {
      "parse" => {
        "master_key" => "1234",
        "applcation_id" => "56789"
      },
      "aws" => {
        "access_key_id" => "abc",
        "secret_access_key_id" => "123"
      }
    }
  end

end