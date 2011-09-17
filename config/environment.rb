# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Psp::Application.initialize!

WillPaginate::ViewHelpers.pagination_options[:previous_label] = '<'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '>'

