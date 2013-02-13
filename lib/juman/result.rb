class Juman
  class Result
    include Enumerable
    def initialize(lines)
      @morphemes = lines.map{|line| Morpheme.new(line) }.freeze
    end

    def each(&block)
      return self.to_enum unless block_given?
      @morphemes.each(&block)
      return self
    end

    def [](nth)
      return @morphemes[nth]
    end

    alias at []
  end
end
