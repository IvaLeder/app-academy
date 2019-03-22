def all_words_capitalized?(arr)
  arr.all? { |el| el == el.capitalize }
end

def no_valid_url?(arr)
  valid = ["com", "net", "io", "org"]
  arr.none? { |el| valid.include?(el.split('.')[1])}
end

def any_passing_students?(arr)
  arr.any? { |s| s[:grades].sum / s[:grades].length >= 75 }
end

students_2 = [
  { name: "Alice", grades: [94, 96] },
  { name: "Bob", grades: [50, 60] }
]
p any_passing_students?(students_2)