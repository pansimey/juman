class Juman
  class Process
    def initialize(command)
      fd0, @writer = IO.pipe
      @reader, fd1 = IO.pipe
      spawn(*command.split(/\s/), in: fd0, out: fd1)
      fd0.close
      fd1.close
    end

    def puts(string)
      @writer.puts(string)
    end

    def readlines
      lines = []
      until (line = @reader.readline)[/^EOS$/]
        lines << line
      end
      return lines
    end
  end
end
