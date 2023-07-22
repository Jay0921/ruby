require "active_support/dependencies/autoload"
require "pry"

module ActiveSupport
  module Autoload
    def autoload(const_name, path = @_at_path)
      unless path
        full = [name, @_under_path, const_name.to_s].compact.join("::")
        path = Inflector.underscore(full)
      end

      if @_eager_autoload
        @_eagerloaded_constants ||= []
        @_eagerloaded_constants << const_name
      end

      super const_name, path
    end
  end
end

# By default, the autoload method will load the module when it is first referenced.
module Autoload
  extend ActiveSupport::Autoload

  autoload :AutoloadModel, "./autoload_model"

  AutoloadModel
end

# Eager loading is useful when you want to load all the constants in a file, regardless of whether they are referenced or not.
module Autoload
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :AutoloadModel, "./autoload_model"
  end
end

Autoload.eager_load!
