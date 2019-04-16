# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
  new_str = ''
  count = 1
  (0..str.length - 1).each do |i|
    if str[i + 1] == str[i]
      count += 1
    else
      new_str << count.to_s if count > 1
      new_str << str[i]
      count = 1
    end
  end
  new_str
end

p compress_str("Kaaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
