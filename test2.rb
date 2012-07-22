require 'json'

class JSONable
    def to_json
        hash = {}
        self.instance_variables.each do |var|
            hash[var] = self.instance_variable_get var
        end
        hash.to_json
    end
    def from_json! string
        JSON.load(string).each do |var, val|
            self.instance_variable_set var, val
        end
    end
end

class A < JSONable

  def new

  end

  def initialize(string, number)
    @string = string
    @number = number
  end
 
  def to_s
    "In A:\n   #{@string}, #{@number}\n"
  end
end

a = A.new('carlos', 21)

# obtenemos el JSON, lo parseamos y lo convertimos a objeto del tipo A
# a la variable a_object
a_object = A.new
a_object.from_json!(a.to_json)

puts a_object.to_s






