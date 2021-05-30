# This program illustrates if-else in Ruby
puts "Fiction or non-fiction"
genre = gets.chomp.downcase

=begin
chomp! is a String class method in Ruby which is used to returns new String with the given record separator removed from the end of str (if present).
 chomp method will also removes carriage return characters (that is it will remove \n, \r, and \r\n) if $/ has not been changed from the default Ruby record separator, t.
If $/ is an empty string, it will remove all trailing newlines from the string. It will return nil if no modifications were made.
=end

if genre == "fiction"
  puts "Try reading Cryptonomicon by Neal Stephenson"

elsif genre == "non-fiction"
  puts "You should read The Ascent of Man by Jacob Brownoski"

else
  puts "Oh I don't know about that genre"
end
