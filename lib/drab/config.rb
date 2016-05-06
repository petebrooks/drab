require "singleton"
require "yaml/store"

module Drab

  class Config

    include Singleton

    def self.[](value)
      instance[value]
    end

    def [](key)
      settings.transaction { settings[key] }
    end

    def []=(key, value)
      settings.transaction { settings[key] = value }
    end

    private

    def settings
      @settings ||= YAML::Store.new(filepath)
    end

    def filepath
      "#{Dir.home}/.drab-config"
    end

  end

end
