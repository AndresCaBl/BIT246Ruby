country = Array["USA","UK","AUS","JPA"]
country.append("NZ")
country.sort!
country.each do |c|
  print "("+c+")" if c[-1]
  end
  print "("+c+")-"
end
end
country.pop
puts country.inspect

#-------------------------------------------#
countries_h = {"k1"=>"USA",
               "k2"=>"UK",
               "k3"=>"AUS",
               "k4"=>"JPA"}
