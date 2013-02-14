require 'juman/version'
require 'juman/process'
require 'juman/result'
require 'juman/morpheme'

class Juman
  def initialize
    @process = Process.new('juman -e2 -B')
  end

  def analyze(text)
    return Result.new(@process.parse_to_lines(text))
  end
end
