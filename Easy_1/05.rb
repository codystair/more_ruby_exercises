=begin
input: string
output: string(printed)
rules:
- strings are encrypted using Rot13:
  - Rot13 means each character is replaced by 13th char after it
- output should decipher each string and print true name

Examples:
'Nqn Ybirynpr' => 'Ada Lovelace'
'Tenpr Ubccre' => 'Grace Hopper'

algorithm:
- set FIRST_HALF to A..M and a..m
- set SECOND_HALF to N..Z and n..z
- set result to empty string:
- iterate throuch characters of input:
  - if FIRST_HALF contains char:
    - set new_char to SECOND_HALF at index of char in FIRST_HALF
    - push new_char to result
  - elsif SECOND_HALF contains char:
    - set new_char to FIRST_HALF at index of char in SECOND_HALF
    - push new_char to result
  - else
    - push char to result
- return result
=end

FIRST = ('A'..'M').to_a + ('a'..'m').to_a
SECOND = ('N'..'Z').to_a + ('n'..'z').to_a
NAMES = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
]

def initialize_table
  result = {}
  FIRST.each_with_index do |char, i|
    result[char] = SECOND[i]
  end
  SECOND.each_with_index do |char, i|
    result [char] = FIRST[i]
  end
  result
end

def rot13(str)
  conversion = initialize_table
  result = ''
  str.each_char do |char|
    if conversion.has_key?(char)
      result << conversion[char]
    else
      result << char
    end
  end
  result
end

def decrypt(arr)
  arr.each do |name|
    puts rot13(name)
  end
end

decrypt(NAMES)