require "drab/config"

module Drab

  class Color

    module Double
      refine String do
        def double
          chars.zip(chars).flatten.join
        end
      end
    end

    using Double

    def self.from_hex(hex_value)
      hex_value = hex_value.double if hex_value.length == 3
      new hex_value.scan(/.{2}/).map { |e| e.to_i(16) }
    end

    attr_reader :red, :green, :blue

    def initialize(args)
      @red, @green, @blue = args
    end

    def to_h
      {
        red: red,
        green: green,
        blue: blue,
      }
    end

    def save!
      config[Dir.pwd] = self
      puts "saving dir #{Dir.pwd}"
    end

    def set!
      set_color(:red, red)
      set_color(:green, green)
      set_color(:blue, blue)
    end

    def set_color(name, value)
      system "echo", "-n", %Q(\033]6;1;bg;#{name};brightness;#{value}\a)
    end

    def config
      Config.instance
    end

  end

end
