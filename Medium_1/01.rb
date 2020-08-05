=begin
input: block
output: return of block

rules:
- has a #listen method and a #play method
- #listen will record anything passed into block
- #play will output most recent recording

examples:
listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

algorithm:
- #listen
  - if block given, push return value of block to recordings
- #play
  - output last item in recordings
=end

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    return unless block_given?
    record(yield)
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
