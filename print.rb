require "json"

def print_gens(gen_0, gen_n)
  gen_0.each.with_index do |row_0, y|
    row_n = gen_n[y]

    row_0.each do |cell|
      print cell ? "X" : "."
    end

    if y == 3
      print "  -->  "
    else
      print "       "
    end

    row_n.each do |cell|
      print cell ? "X" : "."
    end

    puts
  end
end

ARGF.each_line do |line|
  result = JSON.parse(line)
  gen_0 = result.fetch("gen0")
  gen_n = result.fetch("genN")
  print_gens(gen_0, gen_n)
  puts "\n\n"
end

