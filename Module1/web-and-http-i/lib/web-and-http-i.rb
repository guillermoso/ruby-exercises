# Create a Rack web server that responds with the image of a cat
require "rack"
require "thin"
require_relative "application"

Rack::Handler::Thin.run Application.new
