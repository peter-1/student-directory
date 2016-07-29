my_code = File.open($0, "r") do |f|
  f.readlines
end

puts my_code
