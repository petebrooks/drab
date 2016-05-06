module Drab

  module Refinements

    refine String do
      def to_color
        hex_value = self
        hex_value = chars.zip(chars).flatten.join if hex_value.length == 3
        Drab::Color.new hex_value.scan(/.{2}/).map { |e| e.to_i(16) }
      end
    end

    refine Array do
      def to_color
        Drab::Color.new(self)
      end
    end

  end

end
