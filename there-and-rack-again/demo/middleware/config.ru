require './app'
require './angry_middleware'

use AngryMiddleware
run App.new
