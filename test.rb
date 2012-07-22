class Vehiculo
  attr_reader :marchas, :ruedas, :asientos # se hablará de attr_reader
  def initialize(marchas = 1)
    @ruedas = 2
    @asientos = 1
    @marchas = marchas
  end

end
 
class Auto < Vehiculo
  def initialize()
    super(4)
    @asientos = 2
  end
end

t = Tandem.new()
b = Bicicleta.new(4)

puts b.marchas # 4