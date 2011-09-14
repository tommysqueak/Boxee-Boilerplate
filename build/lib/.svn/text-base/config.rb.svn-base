require 'yaml'

module GreatBoxee
  class Config
    def self.environments
      YAML::load( File.open('./environments.yml') )
    end
  end
end