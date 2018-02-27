class Employee
  attr_reader :name, :title

  def initialize (name, title = "Zoo Keeper")
    @name, @title = name, title
  end

  def full_title
     full = "#{@name}, #{@title}"
     full
     #alternative way is to set [@name, @title].join(', ')
  end

  def greet
    "#{@name} waved hello!"
  end

end
