require "singleton"
require "yaml/store"

module Drab

  module Store

    module ClassMethods

      def [](value)
        instance[value]
      end

    end

    module InstanceMethods

      def [](key)
        settings.transaction { settings[transform_key_on_lookup(key)] }
      end

      def []=(key, value)
        settings.transaction { settings[key] = value }
      end

      def settings
        @settings ||= YAML::Store.new(filepath)
      end

      private

      def transform_key_on_lookup(key)
        key
      end

    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
      receiver.send :include, Singleton
    end

  end

end
