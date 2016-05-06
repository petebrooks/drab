module Drab

  class Name

    include Store

    def filepath
      "#{File.dirname(__FILE__)}/data/names.store"
    end

    private

    def transform_key_on_lookup(key)
      key.upcase
    end

  end

end
