class User < ActiveRecord::Base
  def to_displayable_string
    "ID : #{id} | Name : #{name} | Password: #{password}"
  end
end
