module Drab

  class Color

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

    def to_hex
      [red, green, blue].map { |e| e.to_s(16) }.join
    end

    def name
      Drab::Name[to_hex]
    end

    def save!
      config[Dir.pwd] = self
      puts ["Saved color", name.inspect, "for #{Dir.pwd}"].compact.join(" ")
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
