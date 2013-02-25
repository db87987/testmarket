# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Testmarket::Application.initialize!

ActiveRecord::Base.include_root_in_json = true

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
