$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
total = 0
index = 0
 while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

def list_of_directors(source)
  result = []
  count = 0 
  while source[count] do
    result << source[count][:name]
    count += 1
  end
  result
end

def total_gross(source)
  dir_totals = directors_totals(source)
  name_to_check = list_of_directors(source)
  name_count = 0 
  sum = 0 
  while name_to_check[name_count] do
    sum += dir_totals[name_to_check[name_count]]
    name_count += 1 
  end
  sum
end


