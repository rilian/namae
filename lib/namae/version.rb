module Namae
  module Version
    MAJOR = 0
    MINOR = 1
    PATCH = 1
    BUILD = nil

    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.').freeze
  end
end