class Automobile
  attr_accessor :model, :color
  def honk
    puts "Honk!!!"
  end
end
class Explorer < Automobile
end

carro = Explorer.new

p carro.honk