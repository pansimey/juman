class Juman
  class Result
    include Enumerable
    def initialize(lines)
      @morphemes = lines.map{|line| Morpheme.new(line) }.freeze
    end

    def each(*args, &block)
      @morphemes.each(*args, &block)
    end

    def [](nth)
      return @morphemes[nth]
    end

    alias at []
  end
end
