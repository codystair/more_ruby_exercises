=begin
input: block
output: prints to screen
rules:
- #process takes a block
- #process reads a text file and passes it into block

example:
  output:
    3 paragraphs
    15 lines
    126 words

algorithm:
- #process
  - set file to opened text file
  - set text to contents of file
  - pass text into block
  - close file
=end

class TextAnalyzer
  def process
    file = File.open('02.txt')
    text = file.read
    yield(text)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split(' ').size} words" }
