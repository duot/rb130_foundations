require 'minitest/autorun'

require_relative 'text.rb'

class TextTest < Minitest::Test
  def setup
    @file = File.open 'sample.txt', 'r'
    @file2 = File.open 'sample1.txt', 'r'
    @t = Text.new(@file.read)
    @t2 = Text.new(@file2.read)
  end

  def teardown
    @file.close
    @file2.close
    puts "#{@file} close: #{@file.closed?}"
    puts "#{@file2} close: #{@file2.closed?}"
  end

  def test_swap
    result_text = @t.swap 'a', 'e'
    refute_includes 'a', result_text
  end

  def test_word_count
    assert_equal 72, @t.word_count
    assert_equal 1, @t2.word_count
  end
end
