# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Automatically camelCase state keys.
Jbuilder.key_format camelize: :lower
