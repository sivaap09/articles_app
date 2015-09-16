# Load the Rails application.
require File.expand_path('../application', __FILE__)
I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
# Initialize the Rails application.
Rails.application.initialize!
