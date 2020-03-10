require 'pry'

class TextAnalyzer

  def _process
    File.open 'sample.txt', 'r' do |file|
      yield file.read if block_given?
    end
  end

  def process
    file = File.open 'sample.txt', 'r'
    yield file.read if block_given?
  ensure
    file.close
  end
end


analyzer = TextAnalyzer.new
analyzer.process { |txt|
  paragraphs = txt.partition /\n\n/
  puts "#{paragraphs.size} paragraphs"
}

analyzer.process { |txt|
  lines = txt.lines
  puts "#{lines.size} lines"
}

analyzer.process { |txt|
  words = txt.split
  puts "#{words.size} words"
}
