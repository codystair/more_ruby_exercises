require 'minitest/autorun'
require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample.txt')
  end

  def test_swap
    text = Text.new(@file.read)
    actual = text.swap('a', 'e')
    @file.rewind
    expected = @file.read.gsub('a', 'e')

    assert_equal expected, actual
  end

  def test_word_count
    text = Text.new(@file.read)
    actual = text.word_count
    @file.rewind
    expected = @file.read.split.count

    assert_equal expected, actual
  end

  def tear_down
    @file.close
  end
end
