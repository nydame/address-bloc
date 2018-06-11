# Entry model

class Entry
  attr_reader :name
  attr_accessor :phone_number, :email

  def initialize(name, phone_number, email)
      @name = name
      @phone_number = phone_number
      @email = email
  end

  def to_s
      "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

end
