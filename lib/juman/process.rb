class Juman
  class Process
    def initialize(command)
      @io = IO.popen(command, 'r+')
    end

    def parse_to_lines(text)
      @io.puts(text)
      Enumerator.new do |y|
        until @io.gets[/^EOS$/]
          y << $_
        end
      end
    end
  end
end
