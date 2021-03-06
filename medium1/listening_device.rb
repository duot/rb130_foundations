require 'pry'

class Device
  def initialize
    @recordings = []
  end

  def record recording
    @recordings << recording
  end

  def listen
    record yield if block_given?
  end

  def play
    puts recordings
  end

  private
  attr_accessor :recordings
end

listener = Device.new
listener.listen { "HELLO world" }
listener.listen { "listen" }
listener.listen
listener.play #>


