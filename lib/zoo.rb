require_relative 'cage'
require_relative 'employee'
require_relative 'zoo_at_capacity'

class Zoo
    attr_reader :cages, :name, :employees

   def initialize(name, open_date, close_date)
     @name = name
     @open_date = open_date
     @close_date = close_date
     @cages = [].tap do |cages|
     # tap is an operator that assigns the empty array to the variable cages and iterates through it. Then RETURNS cages
       10.times do
         cages << Cage.new
       end
     end
     @employees = []
   end

   def add_employee(employee)
     @employees << employee
   end

   def open?(date)
     if date <= @close_date && date >= @open_date
       return true
     else
       return false
     end
   end

   def add_animal(animal)
     if @cages[-1].empty?
       @cages.each_with_index do |cage, index|
        if cage.empty?
          cage.animal = animal
          break
        end
       end
     else
       raise ZooAtCapacity.new('Your zoo is already at capacity!')
     end
   end

   # another way of doing it is
   # def add_animal(animal)
   #   emtpy_cage = @cages.find{|cage| cage.empty?}
   #    if !empty_cage.nil?
   #      cage.animal = animal
   #    else
   #      raise ZooAtCapacity.new('Your zoo is already at capacity!')
   #    end
   #  end

   def visit
     info = ""
     @employees.each {|employee| info +="#{employee.greet}\n"}
     @cages.each {|cage| info += "#{cage.animal.speak}\n" if !cage.empty?}
     info
   end
end
