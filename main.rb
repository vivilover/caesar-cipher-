def caesar_cipher(string, shift_factor)
=begin
  HELLO! LET'S DO THIS.
  * Gameplan:
    - changing char to ASCII: use "char.ord" method
    - number to char: use "num.chr" method
    - change string to array first, with split method
    - iterate through the array with map method
      - if an entry is an "alphabet", add shift_factor
      - make sure to go around for special cases
        - ex) 'Z' + 3 should be 'C'
        - ex2) 'z' + 2 should be 'b'
      - map returns a shifted string (contains all numbers)
      - use "#chr" method and map to change numbers to chars
      - use "#join" method to change the array back to a string
=end
  # use #split to change original string to an array
  str_array = string.split('')
  # #map method to iterate through each entry in an array
  ascii_array = str_array.map do |char|
    # use "#ord" method to change character to ASCII
    char_to_num = char.ord
    # use inclusive range and #include? method to see IF WE HAVE AN ALPHABET. IF YES, do something
    if (65..90).include? char_to_num # capital letter entry
      # if char_to_num + shift_factor > 90, we go around.
      if char_to_num + shift_factor > 90
        # say our letter is 90 (Z) and we added 1. 91. We want 'A'
        char_to_num = 64 + ((char_to_num + shift_factor) % 90) # 65 + (91 % 90) = 65 + 1 = 66
      # if char_to_num + shift factor > 122, we go around.
      else # Just add shift_factor to char_to_num
        char_to_num += shift_factor
      end
    elsif (97..122).include? char_to_num # smallcase letter entry
      # if char_to_num + shift_factor > 122, we go around
      if char_to_num + shift_factor > 122
        char_to_num = 96 + ((char_to_num + shift_factor) % 122) # if is 123, 96 + 1 = 97 = 'a'
      else
        char_to_num += shift_factor
      end
    else # char_to_num is not an alphabet. Leave it as it is
      char_to_num
    end
  end
  cipher_string = ascii_array.map { |num| num.chr }
  cipher_string.join("")
end

p caesar_cipher("What a string!", 5)