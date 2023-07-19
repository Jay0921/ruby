require "active_support/dependencies/autoload"

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
