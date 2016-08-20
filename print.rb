require "json"

def print_gens(gen_0, gen_n, orthogonal)
  gen_0.each.with_index do |row_0, y|
    row_n = gen_n[y]

    row_0.each do |cell|
      print cell ? "X" : "."
    end

    if y == 2 && orthogonal
      print "  Orthogonal  "
    elsif y == 2
      print "   Diagonal   "
    elsif y == 3
      print "  --------->  "
    else
      print "              "
    end

    row_n.each do |cell|
      print cell ? "X" : "."
    end

    puts
  end
end

ARGF.each_line do |line|
  result = JSON.parse(line)

  if result.empty?
    puts "Fully exhausted the search space."
    exit(0)
  end

  gen_0 = result.fetch("gen0")
  gen_n = result.fetch("genN")
  orthogonal = result.fetch("orthogonal")

  print_gens(gen_0, gen_n, orthogonal)
  puts "\n\n"
end

