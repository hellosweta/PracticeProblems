# Assume values CHARS_TO_ESCAPE are sorted by string length

CHARS_TO_ESCAPE = {
  "'" => "&quot;",
  "&" => "&amp;",
  "<" => "&lt;",
  ">" => "&gt;",
}

def parse_string(raw_string)
  if raw_string.is_a?(String)

    parsed_string = ""

    raw_string.each_char.with_index do |letter, idx|
      if CHARS_TO_ESCAPE.keys.include?(letter)
        parsed_string << escape_chars(letter, idx, raw_string)
      else
        parsed_string << letter
      end
    end

    parsed_string
  end
end

def escape_chars(letter, idx, raw_string)
  if letter == "&"
    longest_length = CHARS_TO_ESCAPE.values[0].length
    string_to_check = raw_string[idx...idx + longest_length]

    if already_escaped?(string_to_check)
      letter
    else
      CHARS_TO_ESCAPE["&"]
    end
  else
    CHARS_TO_ESCAPE[letter]
  end
end

def already_escaped?(string)
  !(string =~ /#{CHARS_TO_ESCAPE.values.join("|")}/).nil? && !string.include?('&&')
end

puts parse_string("Hey!") == "Hey!"
puts parse_string("Hey!&") == "Hey!&amp;"
puts parse_string("'Hey!&quot;'") == "&quot;Hey!&quot;&quot;"
puts parse_string("") == ""
puts parse_string("'Hey!&&quot;'") == "&quot;Hey!&amp;&quot;&quot;"
puts parse_string("") == ""
puts parse_string("&quot;Hey!&&amp;") == "&quot;Hey!&amp;&amp;"
puts parse_string("Hey! How's it going?
Haven't seen you in a while <3") == "Hey! How&quot;s it going?
Haven&quot;t seen you in a while &lt;3"
puts parse_string(123) == nil
