module Drab

  class Config

    include Store

    def filepath
      "#{Dir.home}/.drab-config"
    end

  end

end
