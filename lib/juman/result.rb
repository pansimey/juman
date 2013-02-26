class Juman
  class Result
    include Enumerable
    def initialize(lines)
      @morphemes = lines.map{|line| Morpheme.new(line) }
    end

    def each(&block)
      if block_given?
        @morphemes.each(&block)
        self
      else
        self.to_enum
      end
    end

    def [](nth)
      @morphemes[nth]
    end

    alias at []
  end
end
