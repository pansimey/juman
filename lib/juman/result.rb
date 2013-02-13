class Juman
  class Result
    include Enumerable
    def initialize(lines)
      @morphemes = lines.map{|line| Morpheme.new(line) }.freeze
    end

    def each(*args, &block)
      return @morphemes.each(*args) unless block_given?
      @morphemes.each(*args, &block)
      return self
    end

    def [](nth)
      return @morphemes[nth]
    end

    alias at []
  end
end
