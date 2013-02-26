require 'juman/version'
require 'juman/process'
require 'juman/result'
require 'juman/morpheme'

class Juman
  def initialize
    @process = Process.new('juman -b -e2')
  end

  def analyze(text)
    Result.new(@process.parse_to_lines(text))
  end
end
