class Juman
  class Morpheme
    def initialize(line)
      attrs = line.split(/\s/)
      @surface, @pronunciation, @base, @pos = attrs.shift(4)
      @pos_id = attrs.shift.to_i
      @pos_spec = attr_normalize(attrs.shift)
      @pos_spec_id = attrs.shift.to_i
      @type = attr_normalize(attrs.shift)
      @type_id = attrs.shift.to_i
      @form = attr_normalize(attrs.shift)
      @form_id = attrs.shift.to_i
      @info = info_normalize(attrs.join(' '))
    end
    attr_reader :surface, :pronunciation, :base, :pos, :pos_id, :pos_spec,
      :pos_spec_id, :type, :type_id, :form, :form_id, :info

    private
    def attr_normalize(candidate)
      candidate == '*' ? nil : candidate
    end

    def info_normalize(candidate)
      candidate == 'NIL' ? nil : eval(candidate)
    end
  end
end
